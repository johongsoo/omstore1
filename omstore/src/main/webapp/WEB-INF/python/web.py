from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import cx_Oracle
import time

# Selenium 웹 드라이버 설정
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)

# 웹 페이지 열기
url = 'https://m.shoppinghow.kakao.com/m/search/q/%EB%A7%9D%EC%83%81%EB%A6%AC%ED%86%A0%EB%81%BC%EB%93%A4'
driver.get(url)

# 페이지가 로드될 때까지 대기
time.sleep(10)  # 로딩 대기 시간을 늘립니다.

# 페이지 소스 확인 (디버깅용)
page_source = driver.page_source
print(page_source)  # 페이지 소스가 올바르게 로드되는지 확인

# 상품 정보를 추출
try:
    products = driver.find_elements(By.CSS_SELECTOR, 'div.cont_item')  # 적절한 CSS 선택자 사용
except Exception as e:
    print(f"Error finding products: {e}")
    products = []

if products:
    print(f"총 {len(products)}개의 상품을 찾았습니다.")

    # Oracle 데이터베이스에 연결
    connection = cx_Oracle.connect("scott/tiger@localhost:1521/xe")
    cursor = connection.cursor()

    # 테이블 존재 여부 확인
    try:
        cursor.execute("SELECT * FROM mangbungstore WHERE ROWNUM = 1")
    except cx_Oracle.DatabaseError:
        print("테이블이 존재하지 않으므로 생성합니다.")
        create_table_query = '''
        CREATE TABLE mangbungstore (
            productsid NUMBER PRIMARY KEY,
            name VARCHAR2(255),
            category VARCHAR2(255),
            price VARCHAR2(255),
            image VARCHAR2(255),
            link CLOB
        )
        '''
        cursor.execute(create_table_query)
        print("테이블이 생성되었습니다.")

        # 시퀀스 존재 여부 확인 및 생성
        try:
            cursor.execute("SELECT * FROM user_sequences WHERE sequence_name = 'MY_TABLE_SEQ'")
        except cx_Oracle.DatabaseError:
            print("시퀀스가 존재하지 않으므로 생성합니다.")
            create_sequence_query = '''
            CREATE SEQUENCE my_table_seq
            START WITH 1
            INCREMENT BY 1
            NOCACHE
            NOCYCLE
            '''
            cursor.execute(create_sequence_query)
            print("시퀀스가 생성되었습니다.")
        else:
            print("시퀀스가 이미 존재합니다.")

    # 데이터 삽입을 위한 SQL 구문
    insert_query = '''
    INSERT INTO mangbungstore (productsid, name, category, price, image, link)
    VALUES (my_table_seq.NEXTVAL, :name, :category, :price, :image, :link)
    '''

    for product in products:
        try:
            # 상품 링크 추출
            link_tag = product.find_element(By.CSS_SELECTOR, 'a')
            link = link_tag.get_attribute('href') if link_tag else '#'
            full_link = f'https://m.shoppinghow.kakao.com{link}' if link != '#' else '#'

            # 상품 이미지 추출
            img_tag = product.find_element(By.CSS_SELECTOR, 'img')
            image = img_tag.get_attribute('src') if img_tag else '이미지 없음'

            # 상품 이름 추출
            name_tag = product.find_element(By.CSS_SELECTOR, 'strong.tit_item')
            name = name_tag.text if name_tag else '이름 없음'

            # 상품 가격 추출
            price_tag = product.find_element(By.CSS_SELECTOR, 'div.info_price strong.txt_num')
            price = price_tag.text if price_tag else '가격 없음'

            # 상품 브랜드 추출 (해당 태그가 없다면 생략 가능)
            category_tag = product.find_element(By.CSS_SELECTOR, 'em.emph_seller')
            category = category_tag.text if category_tag else '브랜드 없음'

            # 상품 정보를 데이터베이스에 삽입
            cursor.execute(insert_query, {'name': name, 'category': category, 'price': price, 'image': image, 'link': full_link})

            # 상품 정보 출력 (디버깅용)
            print(f"상품 이름: {name}")
            print(f"브랜드: {category}")
            print(f"가격: {price}")
            print(f"이미지 URL: {image}")
            print(f"링크: {full_link}")
            print('---')
        except Exception as e:
            print(f"Error extracting product info: {e}")

    # 변경 사항 커밋
    connection.commit()
    print("Data inserted successfully.")

    # 커서와 연결 종료
    cursor.close()
    connection.close()
else:
    print("No products found on the webpage.")

# 웹 드라이버 종료
driver.quit()
