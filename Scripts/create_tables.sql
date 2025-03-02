
-- Users table
CREATE TABLE users (
    user_id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role VARCHAR(20) NOT NULL CHECK (role IN ('STUDENT', 'ADVISOR', 'ADMIN')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Questions table
CREATE TABLE questions (
    question_id VARCHAR(36) PRIMARY KEY,
    question_text TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    asked_by_id VARCHAR(36) NOT NULL,
    related_to_type VARCHAR(20) CHECK (related_to_type IN ('COURSE', 'PROGRAM', 'POLICY')),
    related_to_id VARCHAR(36),
    FOREIGN KEY (asked_by_id) REFERENCES users(user_id)
);

-- Responses table
CREATE TABLE responses (
    response_id VARCHAR(36) PRIMARY KEY,
    response_text TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    question_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(question_id)
);

-- Feedback table
CREATE TABLE feedback (
    feedback_id VARCHAR(36) PRIMARY KEY,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    timestamp TIMESTAMP NOT NULL,
    provided_by_id VARCHAR(36) NOT NULL,
    given_on_id VARCHAR(36) NOT NULL,
    FOREIGN KEY (provided_by_id) REFERENCES users(user_id),
    FOREIGN KEY (given_on_id) REFERENCES responses(response_id)
);

-- Courses table
CREATE TABLE courses (
    course_id VARCHAR(36) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    syllabus TEXT,
    instructor VARCHAR(100),
    schedule TEXT
);

-- Course prerequisites (self-referencing relationship)
CREATE TABLE course_prerequisites (
    course_id VARCHAR(36) NOT NULL,
    prerequisite_id VARCHAR(36) NOT NULL,
    PRIMARY KEY (course_id, prerequisite_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (prerequisite_id) REFERENCES courses(course_id)
);

-- Programs table
CREATE TABLE programs (
    program_id VARCHAR(36) PRIMARY KEY,
    program_name VARCHAR(100) NOT NULL
);

-- Program_courses (many-to-many relationship)
CREATE TABLE program_courses (
    program_id VARCHAR(36) NOT NULL,
    course_id VARCHAR(36) NOT NULL,
    is_required BOOLEAN DEFAULT false,
    PRIMARY KEY (program_id, course_id),
    FOREIGN KEY (program_id) REFERENCES programs(program_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Policies table
CREATE TABLE policies (
    policy_id VARCHAR(36) PRIMARY KEY,
    policy_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- University systems table
CREATE TABLE university_systems (
    system_id VARCHAR(36) PRIMARY KEY,
    system_name VARCHAR(100) NOT NULL,
    api_endpoint VARCHAR(255) NOT NULL
);

-- Session tracking
CREATE TABLE user_sessions (
    session_id VARCHAR(100) PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL,
    login_time TIMESTAMP NOT NULL,
    last_activity TIMESTAMP NOT NULL,
    ip_address VARCHAR(45),
    user_agent TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Analytics tracking
CREATE TABLE analytics_events (
    event_id VARCHAR(36) PRIMARY KEY,
    event_type VARCHAR(50) NOT NULL,
    event_data JSON,
    user_id VARCHAR(36),
    timestamp TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Indexes for performance
CREATE INDEX idx_questions_asked_by ON questions(asked_by_id);
CREATE INDEX idx_questions_timestamp ON questions(timestamp);
CREATE INDEX idx_responses_question ON responses(question_id);
CREATE INDEX idx_feedback_response ON feedback(given_on_id);
CREATE INDEX idx_program_courses ON program_courses(program_id, course_id);
CREATE INDEX idx_analytics_timestamp ON analytics_events(timestamp);
CREATE INDEX idx_analytics_user ON analytics_events(user_id);

