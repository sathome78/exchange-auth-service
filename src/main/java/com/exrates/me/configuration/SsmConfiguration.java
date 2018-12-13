package com.exrates.me.configuration;

import com.amazonaws.services.simplesystemsmanagement.AWSSimpleSystemsManagement;
import com.amazonaws.services.simplesystemsmanagement.AWSSimpleSystemsManagementClientBuilder;
import io.github.nmaslukov.SSMGetter;
import io.github.nmaslukov.SSMGetterImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SsmConfiguration {

    @Bean
    public SSMGetter ssmGetter() {
        return new SSMGetterImpl();
    }
}
