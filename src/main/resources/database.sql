-- Table: users
CREATE TABLE users (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
)
  ENGINE = InnoDB;

-- Table: projects
CREATE TABLE projects (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  project_title VARCHAR(255) NOT NULL,
  project_author VARCHAR(255) NOT NULL,
  project_price VARCHAR(255) NOT NULL,
  user_id BIGINT REFERENCES users(id)
)
  ENGINE = InnoDB;

-- Table: tasks
CREATE TABLE tasks (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  task_description VARCHAR(255) NOT NULL,
  project_id BIGINT REFERENCES projects(id)
)
  ENGINE = InnoDB;

-- Table: comments
CREATE TABLE comments (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  comment_content VARCHAR(255) NOT NULL,
  task_id BIGINT REFERENCES tasks(id)
)
  ENGINE = InnoDB;

-- Table: roles
CREATE TABLE roles (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
)
  ENGINE = InnoDB;

-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
)
  ENGINE = InnoDB;

-- Insert data

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);