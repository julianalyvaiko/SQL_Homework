CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR
);
CREATE TABLE dept_emp (
	emp_no integer,
	dept_no VARCHAR,
	from_date VARCHAR,
	to_date VARCHAR
);
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INTEGER,
	from_date VARCHAR,
	to_date VARCHAR
);
CREATE TABLE employees (
	emp_no INTEGER,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	gender VARCHAR,
	hire_date VARCHAR,
);
CREATE TABLE salaries (
	emp_no INTEGER,
	salary INTEGER,
	from_date VARCHAR,
	to_date VARCHAR
);
CREATE TABLE titles (
	emp_no INTEGER,
	title VARCHAR,
	from_date VARCHAR,
	to_date VARCHAR
);