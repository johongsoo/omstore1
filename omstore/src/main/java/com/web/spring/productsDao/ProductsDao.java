package com.web.spring.productsDao;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.web.spring.vo.Cart;
import com.web.spring.vo.MangbungStore;
import com.web.spring.vo.OdungStore;

@Mapper
public interface ProductsDao {

	@Select("SELECT * \r\n"
			+ "FROM odungstore \r\n"
			+ "WHERE name LIKE '%'||#{name}||'%'\r\n"
			+ "AND category LIKE '%'||#{category}||'%'")
	
	List<OdungStore> odunglist(OdungStore odung);
	
	@Select("SELECT * \r\n"
			+ "FROM odungstore \r\n"
			+ "WHERE productsid = #{productsid} ")
	
	OdungStore getodungdetail(@Param("productsid") int productsid);

/* =============================================================================== */	
	
	@Select("SELECT * \r\n"
			+ "FROM mangbungstore \r\n"
			+ "WHERE name LIKE '%'||#{name}||'%'\r\n"
			+ "AND category LIKE '%'||#{category}||'%'")
	
	List<MangbungStore> mangbunglist(MangbungStore mangbung);

	@Select("SELECT * \r\n"
			+ "FROM mangbungstore \r\n"
			+ "WHERE productsid = #{productsid} ")
	
	MangbungStore getmangbungdetail(@Param("productsid") int productsid);
	
	@Insert("INSERT INTO cart (userid, product_img, product_name, product_price, quantity) VALUES (#{userid}, #{product_img}, #{productName}, #{productPrice}, #{quantity})")
	void addCartItem(
	    @Param("userid") String userid, 
	    @Param("product_img") String productImg, 
	    @Param("productName") String productName, 
	    @Param("productPrice") BigDecimal productPrice, 
	    @Param("quantity") int quantity
	);
	
    @Select("SELECT cartid, userid, product_name, product_price, quantity " +
            "FROM cart " +
            "WHERE userid = #{userid}")
    List<Cart> getCartByUserId(String userid);

}