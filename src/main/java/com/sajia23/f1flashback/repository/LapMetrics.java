package com.sajia23.f1flashback.repository;

import com.influxdb.annotations.Column;
import com.influxdb.annotations.Measurement;

import java.time.Instant;

@Measurement(name = "crawler_metrics")
public class LapMetrics {

    @Column(tag = true)
    private String url;

    @Column
    private long responseTime;

    @Column(timestamp = true)
    private Instant time;

    // Getters and setters
}

