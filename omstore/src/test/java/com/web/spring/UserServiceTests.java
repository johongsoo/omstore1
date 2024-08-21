package com.web.spring;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.web.spring.mainDao.MainDao;
import com.web.spring.mainService.MainService;
import com.web.spring.vo.Users;

@SpringBootTest
public class UserServiceTests {
    @Autowired
    private MainService userService;

    @Autowired
    private MainDao userDAO;

    @Test
    public void testRegisterUser() {
        Users user = new Users();
        user.setUserid("testuser");
        user.setName("Test User");
        user.setPwd("password");
        user.setEmail("testuser@example.com");
        user.setBirthdate("2000-01-01");
        user.setAddress("Test Address");
        user.setAddress1("Test Address 1");
        user.setAddress2("Test Address 2");
        user.setPhone("1234567890");
        user.setRating("일반회원");
        user.setPoint(0);

        userService.registerUser(user);

        // Optional: Verify the user was added by querying the database
        Users fetchedUser = userDAO.findById("testuser"); // Example method, you need to implement this
        assertNotNull(fetchedUser);
        assertEquals("Test User", fetchedUser.getName());
    }
}
