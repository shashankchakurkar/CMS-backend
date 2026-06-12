-- =========================
-- USERS
-- =========================
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  role VARCHAR(20) NOT NULL CHECK (role IN ('ADMIN','TEACHER')),
  staff_id UUID,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- =========================
-- STAFF
-- =========================
CREATE TABLE staff (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  employee_code VARCHAR(20) UNIQUE NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  phone VARCHAR(15),
  email VARCHAR(150),
  role VARCHAR(30) NOT NULL,
  join_date DATE,
  status VARCHAR(20) DEFAULT 'ACTIVE',
  created_at TIMESTAMP DEFAULT NOW()
);

-- =========================
-- STUDENTS
-- =========================
CREATE TABLE students (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  student_code VARCHAR(20) UNIQUE NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  dob DATE,
  gender VARCHAR(10),
  phone VARCHAR(15),
  email VARCHAR(150),
  address TEXT,
  guardian_name VARCHAR(100),
  guardian_phone VARCHAR(15),
  status VARCHAR(20) DEFAULT 'ACTIVE',
  joined_date DATE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- =========================
-- SUBJECTS
-- =========================
CREATE TABLE subjects (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(100) NOT NULL,
  code VARCHAR(20) UNIQUE NOT NULL,
  description TEXT
);

-- =========================
-- CLASSES
-- =========================
CREATE TABLE classes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(100) NOT NULL,
  description TEXT,
  teacher_id UUID,
  academic_year VARCHAR(10) NOT NULL,
  max_students INT,
  status VARCHAR(20) DEFAULT 'ACTIVE',
  created_at TIMESTAMP DEFAULT NOW()
);

-- =========================
-- CLASS SUBJECTS
-- =========================
CREATE TABLE class_subjects (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  class_id UUID,
  subject_id UUID,
  teacher_id UUID
);

-- =========================
-- ENROLLMENTS
-- =========================
CREATE TABLE enrollments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  student_id UUID,
  class_id UUID,
  academic_year VARCHAR(10) NOT NULL,
  enrolled_date DATE DEFAULT CURRENT_DATE,
  status VARCHAR(20) DEFAULT 'ACTIVE'
);

-- =========================
-- ATTENDANCE
-- =========================
CREATE TABLE attendance (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  student_id UUID,
  class_id UUID,
  subject_id UUID,
  date DATE NOT NULL,
  status VARCHAR(20) NOT NULL,
  marked_by UUID,
  created_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(student_id, class_id, subject_id, date)
);

CREATE INDEX idx_attendance_class_date ON attendance(class_id, date);
CREATE INDEX idx_attendance_student_date ON attendance(student_id, date);

-- =========================
-- EXAMS
-- =========================
CREATE TABLE exams (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(150) NOT NULL,
  class_id UUID,
  subject_id UUID,
  exam_date DATE,
  start_time TIME,
  duration_mins INT,
  max_marks INT,
  created_by UUID,
  created_at TIMESTAMP DEFAULT NOW()
);

-- =========================
-- EXAM RESULTS
-- =========================
CREATE TABLE exam_results (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  exam_id UUID,
  student_id UUID,
  marks_obtained DECIMAL(5,2),
  is_absent BOOLEAN DEFAULT FALSE,
  remarks TEXT,
  UNIQUE(exam_id, student_id)
);