select * from HR.employees;
select * from HR.departments;
select * from HR.countries;
select * from HR.regions;
select * from HR.locations;

/* Question 1 */
/* Puneet Anand s10_ananpune*/
set serveroutput ON; 
declare 

v_fname varchar2(50);
v_lname varchar2(50);
v_sal number;
v_reg varchar2(50);
v_country varchar2(50);
v_number number:=0;



cursor c_emp is
select first_name, last_name, salary, r.region_name, c.country_name
from hr.employees e
join hr.departments d on e.department_id = d.department_id
join hr.locations l on d.location_id = l.location_id
join hr.countries c on l.country_id = c.country_id
join hr.regions r on c.region_id = r.region_id
order by salary asc;


begin

OPEN c_emp;


loop
fetch c_emp INTO v_fname, v_lname, v_sal, v_reg, v_country;
v_number := v_number + 1;
dbms_output.put_line('First Name: ' || v_fname || '     Last Name: ' || v_lname || '      Salary: '|| v_sal || '   Region: ' || v_reg || '   Country: ' || v_country );

exit when v_number > 4;
end loop;
close c_emp;
end;











/* Question 2 */
/* Puneet Anand s10_ananpune*/
set serveroutput ON; /*allow server output*/
declare num1 number:= 0; 
num2 number := 1;
num3 number;
final number := 11;   /*Since within 100 we want the 12th fibonacci number as our final fib number, 0-11 is 12 indexes*/       
iteration number; /*holds index*/
begin 
dbms_output.put_line(num1);
dbms_output.put_line(num2);   /*outputting the first two number so they don't get messed with*/
for iteration in 2..final /*&we start at 2 even though we printed 1 already, need it for the third fib value */
loop
num3:= num1 + num2;    /*simple loop like a linked list to add the previous two numbers and reassign them values */
num1:=num2;
num2:=num3;
dbms_output.put_line(num3);
end loop;
end;


/* Question 3 */
/* Puneet Anand s10_ananpune*/
set serveroutput ON;
declare
v_empid hr.employees.employee_id%TYPE;
v_fname hr.employees.first_name%TYPE;
v_lname hr.employees.last_name%TYPE;
v_email hr.employees.email%TYPE;
v_pnum hr.employees.phone_number%TYPE;
v_hired hr.employees.hire_date%TYPE;
v_jobid hr.employees.job_id%TYPE;
v_salary hr.employees.salary%TYPE;
v_compct hr.employees.commission_pct%TYPE;
v_man hr.employees.manager_id%TYPE;
v_dep hr.employees.department_id%TYPE;


cursor c_emps is 
select employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id from hr.employees;

begin
open c_emps;
loop
fetch c_emps into v_empid, v_fname,v_lname, v_email, v_pnum, v_hired, v_jobid, v_salary, v_compct, v_man, v_dep;
dbms_output.put_line('Employee Id: ' || v_empid || '     First Name: ' || v_fname || '     Last Name: ' || v_lname
|| '     Email: ' || v_email || '     Phone Number: ' || v_pnum || '     Hire Date: ' || v_hired || '     Job ID: '
|| v_jobid || '     Salary: ' || v_salary || 'Commission Percentage: ' || v_compct || '     Manager: ' || v_man
|| '     Department: ' || v_dep);
EXIT WHEN c_emps%NOTFOUND;
end loop;
close c_emps;
end;







