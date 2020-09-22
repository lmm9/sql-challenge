SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s ON
e.emp_no=s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date>'1985-12-31' AND hire_date<'1987-01-01';

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM department_manager AS dm
JOIN employees as e ON dm.emp_no=e.emp_no
JOIN departments as d ON dm.dept_no=d.dept_no;

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN department_employee as de ON e.emp_no=de.emp_no
JOIN departments as d ON d.dept_no=de.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules'
AND last_name LIKE 'B%';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees AS e
JOIN department_employee AS de ON e.emp_no=de.emp_no
JOIN departments AS d ON de.dept_no=d.dept_no
WHERE de.dept_no IN
  (SELECT dept_no FROM departments
  WHERE dept_name='Sales');

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees AS e
JOIN department_employee AS de ON e.emp_no=de.emp_no
JOIN departments AS d ON de.dept_no=d.dept_no
WHERE de.dept_no IN
  (SELECT dept_no FROM departments
  WHERE dept_name='Sales'
  OR dept_name='Development');

SELECT last_name, COUNT(first_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Frequency" DESC;