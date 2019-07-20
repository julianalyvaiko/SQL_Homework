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
--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no AS "Employee Number", 
               employees.last_name AS "Last Name",
			   employees.first_name AS "First Name",
			   employees.gender AS "Gender",
               salaries.salary AS "Salary"
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

--2.List employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date LIKE '%1986%';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT
d.dept_no,
b.dept_name,
d.emp_no,
e.last_name,
e.first_name,
d.from_date,
d.to_date
FROM employees e, dept_manager d, departments b
FETCH FIRST 1000 ROW ONLY;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
e.emp_no,
e.last_name,
e.first_name,
d.dept_name
FROM employees e, departments d;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,last_name
FROM employees
WHERE first_name = 'Hercules'
      and last_name Like'B%';
	  
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name LIKE 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees AS e
INNER JOIN dept_emp AS d ON
e.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no
WHERE dp.dept_name LIKE 'Development'
OR dp.dept_name LIKE 'Sales';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT
    last_name,
    count(last_name)
FROM employees
GROUP BY
    last_name
ORDER BY last_name DESC;
