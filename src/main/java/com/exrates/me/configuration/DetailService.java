package com.exrates.me.configuration;

import com.exrates.me.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.stream.Collectors;

import static org.springframework.security.core.userdetails.User.builder;


@Component(value = "UserDetailsService")
@Primary
public class DetailService implements UserDetailsService {


    @Autowired
    private UserRepository userRepository;


    @Cacheable(value = "loadUserByName", key = "#login")
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        return getUserFromDb(login);
    }

    private UserDetails getUserFromDb(String login) {
        try {
            com.exrates.me.domain.User user = userRepository.findByemail(login);
            UserDetails build = builder().
                    username(login).
                    password(user.getPassword()).
                    disabled(!ifUserAllowed(user.getStatus())).
                    accountExpired(false).
                    credentialsExpired(false).
                    accountLocked(false).
                    authorities(getAuthorities(login)).
                    build();
            return build;
        } catch (Exception e) {
            throw new UsernameNotFoundException("Несуществующий логин");
        }
    }

    private Collection<GrantedAuthority> getAuthorities(String login) {
        return userRepository.getUserAuthorities(login).stream()
                .map(SimpleGrantedAuthority::new).collect(Collectors.toList());
    }

    private boolean ifUserAllowed(int status) {
        return status == 2 || status == 4;
    }
}
