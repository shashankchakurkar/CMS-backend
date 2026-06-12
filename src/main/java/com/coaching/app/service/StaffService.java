package com.coaching.app.service;

import com.coaching.app.model.Staff;
import com.coaching.app.repository.StaffRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StaffService {

    private final StaffRepository repo;

    public StaffService(StaffRepository repo) {
        this.repo = repo;
    }

    public List<Staff> getAll() {
        return repo.findAll();
    }

    public Staff addStaff(Staff staff) {

        if (staff.getEmployeeCode() == null) {
            staff.setEmployeeCode("EMP" + System.currentTimeMillis());
        }

        return repo.save(staff);
    }


}