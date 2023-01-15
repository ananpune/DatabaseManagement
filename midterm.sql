select * from HR.jobs;
select * from HR.departments;
select * from HR.job_history;
select * from HR.employees;
/* Q1 Write a query to list out employee first name, last name , department id , salary and proposed salary.[Use HR schema]

Proposed salary calculation based on job_id;

Proposed salary = salary + increment*/
select e.first_name, e.last_name, j.job_id, e.salary, 
    CASE 
    WHEN j.job_id LIKE 'AD_PRES' THEN 
        e.salary + 10000
    WHEN j.job_id LIKE 'AD_VP' THEN
        e.salary + 5000
    WHEN j.job_id LIKE 'ST_CLERK' THEN
        e.salary + 1000
    WHEN j.job_id LIKE 'ST_MAN' THEN
        e.salary + 2000
    WHEN j.job_id LIKE 'IT_PROG' THEN
        e.salary + 3000
    WHEN j.job_id LIKE 'SA_MAN' THEN
        e.salary + 500
    END AS "Proposed Salary"
    FROM hr.jobs j, hr.employees e
    WHERE j.job_id = e.job_id;

/*Q4 Write a PL/SQL block to calculate the total percentage [combined 3 course grades and calculate overall percentage]of a student based on given scores.

note: Take user input for grades[marks] out of 100 for 3 courses and do calculation accordingly. Use PL variables and substitution variables as and when needed and print appropriate result.

for ex. Total Percentage= 56% */

DECLARE
     v_markOne number;
     v_markTwo number;
     v_markThree number;
     p_markOne number;
     p_markTwo number;
     p_markThree number;
     v_percent number;
BEGIN 
while v_markOne > 100 or p_markOne < 0

    ACCEPT v_gradeOne PROMPT 'Enter a grade 0~100'
END LOOP;
while v_markTwo > 100 or p_markTwo < 0
    ACCEPT v_gradeTwo PROMPT 'Enter a grade 0~100'
END LOOP;
while v_markThree > 100 or p_markThree < 0
    ACCEPT v_gradeTwo PROMPT 'Enter a grade 0~100'
END LOOP;
v_percent := (p_gradeOne + p_gradeTwo + p_gradeThree) / 3;
DMS_OUTPUT.put_line(v_percentage || '%');
END;

/* Q3 1: If you have to retrieve the employee name and employee's manager name from the given table. Suggest the type of join you will use for this purpose and justify your answer.[1 Mark]

2. Write the SQL query for suggested join to retrieve the employee name and employee's manager name from the given table. [1 Mark]

3. Write SQL query to return the names of the employees who are directly and indirectly managed by David Lee. Explain the hierarchy at level 2 and level 3 in your own words. [1 Mark]

4. What is the advantage of using Hierarchical query in point 3. [1 Mark] */

/*2*/
select e.first_name as empfirstname, e.last_name as emplastname, m.first_name as manfirstname, m.last_name as manlastname
from hr.employees e
join hr.employees m
on e.manager_id = m.employee_id;

/*3*/
select first_name, last_name, level
     from hr.employees
    where level = 2 or level= 3
connect by prior manager_id = employee_id
    start with first_name = 'David' AND last_name = 'Lee';


