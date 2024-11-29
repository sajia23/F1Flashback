package com.sajia23.f1flashback.mapper;

import org.apache.ibatis.annotations.Insert;

public class Mapper {
    public interface MySQLMapper {
        @Insert("INSERT INTO crawl_results (url, title, created_at) VALUES (#{url}, #{title}, NOW())")
        void insertDriver(String url, String title);
    }

}
