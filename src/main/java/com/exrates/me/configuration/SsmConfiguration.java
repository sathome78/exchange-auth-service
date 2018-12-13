package com.exrates.me.configuration;

import me.exrates.SSMGetter;
import me.exrates.SSMGetterImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SsmConfiguration {

    @Bean
    public SSMGetter ssmGetter() {
        return new SSMGetterImpl();
    }
}
