package com.sajia23.f1flashback.config;

import com.influxdb.client.InfluxDBClient;
import com.influxdb.client.InfluxDBClientFactory;
import com.sajia23.f1flashback.model.InfluxDBProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class InfluxDBConfig {

    private final InfluxDBProperties properties;

    public InfluxDBConfig(InfluxDBProperties influxDBProperties) {
        this.properties = influxDBProperties;
    }

    @Bean
    public InfluxDBClient influxDBClient() {
        return InfluxDBClientFactory.create(properties.getUrl(), properties.getToken().toCharArray());
    }
}

