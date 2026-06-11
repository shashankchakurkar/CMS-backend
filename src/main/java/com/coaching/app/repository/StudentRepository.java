package com.coaching.app.repository;

import com.coaching.app.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
    // Basic CRUD functions come out-of-the-box
}