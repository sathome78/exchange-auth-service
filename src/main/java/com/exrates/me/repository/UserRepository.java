package com.exrates.me.repository;

import com.exrates.me.domain.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends CrudRepository<User, Long> {
    User findByemail(String email);

    @Query(nativeQuery = true, value = "select USER_ROLE.name as role_name from USER \n" +
            "inner join USER_ROLE on USER.roleid = USER_ROLE.id \n" +
            "where USER.email = :email \n" +
            "UNION \n" +
            "SELECT ADMIN_AUTHORITY.name AS role_name from USER \n" +
            "inner join USER_ADMIN_AUTHORITY on USER_ADMIN_AUTHORITY.user_id = USER.id \n" +
            "inner join ADMIN_AUTHORITY on USER_ADMIN_AUTHORITY.admin_authority_id = ADMIN_AUTHORITY.id \n" +
            "where USER.email = :email AND USER_ADMIN_AUTHORITY.enabled = 1 ")

    List<String> getUserAuthorities(@Param("email") String email);
}
