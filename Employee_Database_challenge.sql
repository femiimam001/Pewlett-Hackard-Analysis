SELECT * FROM retirement_titles;		
-- Deliverable 1: The Number of Retiring Employees by Title	1
--  Use the INNER JOIN clause to join two tables on a primary key 
SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;	


-- Use Dictinct with Orderby to remove duplicate rows
-- SELECT DISTINCT ON (______) _____,
-- ______,
-- ______,
-- ______

-- INTO nameyourtable
-- FROM _______
-- WHERE _______
-- ORDER BY _____, _____ DESC;
-- Use Dictinct with Orderby to remove duplicate rows for part 2/Deliverable 1
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no ASC, to_date DESC;


-- Use Count to determine number of retirement-age employees by most recent job title 2/Deliverable 1
SELECT * FROM retiring_titles;
SELECT 
	COUNT(ut.emp_no),Ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

