package com.coaching.app.controller;

import com.coaching.app.model.Staff;
import com.coaching.app.service.StaffService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/staff")
public class StaffController {

    private final StaffService service;

    public StaffController(StaffService service) {
        this.service = service;
    }

    @PostMapping
    public Staff add(@RequestBody Staff staff) {
        return service.addStaff(staff);
    }

    @GetMapping
    public List<Staff> getAll() {
        return service.getAll();
    }

}