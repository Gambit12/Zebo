package com.example.zebo.repos;

import com.example.zebo.domain.Role;
import com.example.zebo.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);

    User findByActivationCode(String code);
//    User findByRole (Role roles);
}
