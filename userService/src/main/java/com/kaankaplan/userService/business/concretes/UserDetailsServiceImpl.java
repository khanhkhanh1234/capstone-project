package com.kaankaplan.userService.business.concretes;

import com.kaankaplan.userService.business.abstracts.UserService;
import com.kaankaplan.userService.entity.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl  implements UserDetailsService {

    private final UserService userService;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userService.getUserByEmail(email);

        if(user == null) {
            throw new UsernameNotFoundException("Kullanıcı bulunamadı");
        }

        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        System.out.println(user.getClaim());
//        System.out.println(user.getClaim().getClaimName());
        if(user.getClaim() == null) {
            throw new UsernameNotFoundException("Ma Cha may");
        }
        if(user.getClaim().getClaimName() == null) {
            throw new UsernameNotFoundException("Ma Cha may 2");
        }
        authorities.add(new SimpleGrantedAuthority(user.getClaim().getClaimName()));

        return new org.springframework.security.core.userdetails.User(
                user.getEmail(), user.getPassword(), authorities);
    }

}
