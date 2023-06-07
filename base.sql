CREATE DATABASE services;

USE services;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    email_verified_at TIMESTAMP NULL,
    userType VARCHAR(255) NULL,
    password VARCHAR(255) NOT NULL,
    verified TINYINT(1) DEFAULT 0,
    completed TINYINT(1) DEFAULT 0,
    remember_token VARCHAR(100) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);
CREATE TABLE password_resets (
    email VARCHAR(255) NOT NULL,
    token VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL
);
CREATE TABLE failed_jobs (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    uuid VARCHAR(255) UNIQUE,
    connection TEXT,
    queue TEXT,
    payload LONGTEXT,
    exception LONGTEXT,
    failed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE personal_access_tokens (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tokenable_id INT UNSIGNED NOT NULL,
    tokenable_type VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    token VARCHAR(64) UNIQUE,
    abilities TEXT NULL,
    last_used_at TIMESTAMP NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);
CREATE TABLE personal_infos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    first_name VARCHAR(255) NULL,
    last_name VARCHAR(255) NULL,
    photo_path VARCHAR(255) NULL,
    birthday VARCHAR(255) NULL,
    gender VARCHAR(255) NULL,
    phone VARCHAR(255) NULL,
    country VARCHAR(255) NULL,
    city VARCHAR(255) NULL,
    street VARCHAR(255) NULL,
    website VARCHAR(255) NULL,
    linkedin VARCHAR(255) NULL,
    facebook VARCHAR(255) NULL,
    twitter VARCHAR(255) NULL,
    email VARCHAR(255) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE professional_infos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    about TEXT NULL,
    user_id INT UNSIGNED NULL,
    role VARCHAR(255) NULL,
    qualification VARCHAR(255) NULL,
    cv VARCHAR(255) NULL,
    cover_letter VARCHAR(255) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE education (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    professional_info_id INT UNSIGNED NOT NULL,
    school VARCHAR(255) NULL,
    degree VARCHAR(255) NULL,
    graduation VARCHAR(255) NULL,
    start VARCHAR(255) NULL,
    field VARCHAR(255) NULL,
    description TEXT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (professional_info_id) REFERENCES professional_infos(id) ON DELETE CASCADE
);
CREATE TABLE experiences (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    professional_info_id INT UNSIGNED NOT NULL,
    title VARCHAR(255) NULL,
    name VARCHAR(255) NULL,
    end VARCHAR(255) NULL,
    start VARCHAR(255) NULL,
    type VARCHAR(255) NULL,
    description TEXT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (professional_info_id) REFERENCES professional_infos(id) ON DELETE CASCADE
);
CREATE TABLE languages (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    professional_info_id INT UNSIGNED NOT NULL,
    language VARCHAR(255) NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (professional_info_id) REFERENCES professional_infos(id) ON DELETE CASCADE
);
CREATE TABLE messages (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    text TEXT NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);
CREATE TABLE images (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    image_name VARCHAR(255) NOT NULL,
    user_id INT UNSIGNED,
    service_id INT UNSIGNED,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (service_id) REFERENCES service_forms(id)
);
CREATE TABLE image_gallary (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    img_path VARCHAR(255),
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE TABLE service_form (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED,
    service_title VARCHAR(255) NOT NULL,
    experience TEXT,
    location VARCHAR(255),
    price DECIMAL(10, 2),
    service_categorie VARCHAR(255),
    position VARCHAR(255),
    service_description TEXT,
    photo VARCHAR(255),
    skills_experiences TEXT,
    date_posted DATE,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

