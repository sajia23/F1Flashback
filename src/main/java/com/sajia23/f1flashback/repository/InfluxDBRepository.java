package com.sajia23.f1flashback.repository;

import com.influxdb.client.InfluxDBClient;
import com.influxdb.client.WriteApi;
import com.sajia23.f1flashback.model.InfluxDBProperties;
import org.springframework.stereotype.Repository;

@Repository
public class InfluxDBRepository {

    private final InfluxDBClient influxDBClient;

    private final InfluxDBProperties properties;

    public InfluxDBRepository(InfluxDBClient influxDBClient, InfluxDBProperties influxDBProperties) {
        this.influxDBClient = influxDBClient;
        this.properties = influxDBProperties;
    }

    public void writeMetrics(LapMetrics metrics) {
        try (WriteApi writeApi = influxDBClient.getWriteApi()) {

            //writeApi.writeMeasurement(properties.getBucket(), properties.getOrg(), metrics, null);
        }
    }

//    public void writeRawData(String measurement, String field, double value) {
//        try (WriteApi writeApi = influxDBClient.getWriteApi()) {
//            Point point = Point
//                    .measurement(measurement)
//                    .addField(field, value)
//                    .time(Instant.now(), WritePrecision.MS);
//            writeApi.writePoint("my-bucket", "my-org", point);
//        }
//    }
}

