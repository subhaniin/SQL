CREATE TABLE citizens (
    citizen_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100),
    date_of_birth DATE,
    gender VARCHAR(10),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT,
    state VARCHAR(50),
    district VARCHAR(50),
    pincode VARCHAR(10),
    nationality VARCHAR(50),
    religion VARCHAR(50),
    marital_status VARCHAR(20),
    blood_group VARCHAR(5),
    father_name VARCHAR(100),
    mother_name VARCHAR(100),
    photo_path TEXT,
    application_status VARCHAR(20) DEFAULT 'Pending',
    application_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE admins (
    admin_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role VARCHAR(20) DEFAULT 'verifier'
);

CREATE TABLE approved_ids (
    id_number VARCHAR(12) PRIMARY KEY,
    citizen_id INTEGER REFERENCES citizens(citizen_id),
    approved_by INTEGER REFERENCES admins(admin_id),
    approval_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE login_logs (
    log_id SERIAL PRIMARY KEY,
    user_type VARCHAR(10),           -- 'admin' or 'citizen'
    user_id INTEGER,                 -- citizen_id or admin_id
    action VARCHAR(100),            -- 'login', 'view_citizen', 'approve_id', etc.
    target_citizen_id INTEGER,      -- who they viewed/edited (optional)
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE rejected_applications (
    rejection_id SERIAL PRIMARY KEY,
    citizen_id INTEGER REFERENCES citizens(citizen_id),
    rejected_by INTEGER REFERENCES admins(admin_id),
    rejection_reason TEXT,
    rejection_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE document_uploads (
    doc_id SERIAL PRIMARY KEY,
    citizen_id INTEGER REFERENCES citizens(citizen_id),
    document_type VARCHAR(50),           -- e.g., 'passport', 'electricity_bill', 'birth_certificate'
    file_name TEXT,
    file_path TEXT,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from citizens;
