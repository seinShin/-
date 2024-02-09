package interviewRecipe.interviewRecipe.security;

import jakarta.servlet.DispatcherType;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SpringSecurityConfig {

    @Bean
    BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    private final AuthenticationFailureHandler authenticationFailureHandler;
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
        http.csrf().disable().cors().disable()
                .authorizeHttpRequests(request -> request
                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                        .requestMatchers("/static/**").permitAll()
                        .requestMatchers("/index", "/").permitAll()
                        .requestMatchers("/member/join").permitAll()
                        .requestMatchers("/login").permitAll()
                        .anyRequest().authenticated()
                )
                .formLogin(login -> login
                        .loginPage("/")
                        .usernameParameter("userNm")
                        .passwordParameter("userPw")
                        .loginProcessingUrl("/login")
                        .defaultSuccessUrl("/main", true)
                        .failureHandler(authenticationFailureHandler)
                        .permitAll()
                )
                .logout(Customizer.withDefaults());
        return http.build();
    }
}
