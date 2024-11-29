package com.sajia23.f1flashback.service;
import com.sajia23.f1flashback.repository.InfluxDBRepository;
import com.sajia23.f1flashback.repository.LapMetrics;
import org.springframework.stereotype.Service;

@Service
public class InfluxDBService {
    private final InfluxDBRepository repository;

    public InfluxDBService(InfluxDBRepository repository) {
        this.repository = repository;
    }

    public void saveCrawlerMetrics(String url, long responseTime) {
        LapMetrics metrics = new LapMetrics();
//        metrics.setUrl(url);
//        metrics.setResponseTime(responseTime);
//        metrics.setTime(Instant.now());
        repository.writeMetrics(metrics);
    }

}
