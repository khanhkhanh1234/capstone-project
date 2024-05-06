package com.kaankaplan.userService.business.concretes;

import com.kaankaplan.userService.business.abstracts.AuthService;
import com.kaankaplan.userService.business.abstracts.UserService;
import com.kaankaplan.userService.core.security.JwtProviderService;
import com.kaankaplan.userService.entity.User;
import com.kaankaplan.userService.entity.dto.UserAuthenticationResponseDto;
import com.kaankaplan.userService.entity.dto.UserLoginRequestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import java.util.stream.Collectors;


@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {

    private final AuthenticationManager authenticationManager;
    private final JwtProviderService jwtProvider;
    private final UserService userService;

    @Override
    public UserAuthenticationResponseDto login(UserLoginRequestDto userLoginRequestDto) {
        User user = userService.getUserByEmail(userLoginRequestDto.getEmail());

        System.out.println(user.getPassword());
        System.out.println(userLoginRequestDto.getPassword());
            Authentication authenticate = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(
                    userLoginRequestDto.getEmail(),
                    userLoginRequestDto.getPassword()
            ));
            System.out.println("1234");
            SecurityContextHolder.getContext().setAuthentication(authenticate);
            System.out.println("12345");
            String token = jwtProvider.generateToken(authenticate);
            System.out.println(token);

            return UserAuthenticationResponseDto.builder()
                    .userId(user.getUserId())
                    .fullName(user.getFullName())
                    .email(userLoginRequestDto.getEmail())
                    .token(token)
                    .roles(authenticate.getAuthorities().stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList()))
                    .build();

    }

}
