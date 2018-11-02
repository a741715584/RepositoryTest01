package com.qfedu.service;

import com.qfedu.domain.Major;

import java.util.List;

public interface MajorService {
    List<Major> selectByDepartId(String departId);
}
