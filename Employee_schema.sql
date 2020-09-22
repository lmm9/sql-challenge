CREATE TABLE employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL
);

CREATE TABLE department_employee (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR   NOT NULL
);

CREATE TABLE department_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INTEGER   NOT NULL
);

CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

ALTER TABLE employees
ADD FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries 
ADD FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE department_employee 
ADD FOREIGN KEY("emp_no")
REFERENCES employees (emp_no);

ALTER TABLE department_employee  
ADD FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE department_manager
ADD FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE department_manager
ADD FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);
