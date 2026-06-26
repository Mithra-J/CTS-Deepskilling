create or replace procedure UpdateEmployeeBonus(
    p_department in varchar2,
    p_bonus_percent in number
) as 
begin
update employees set salary=salary+(salary*p_bonus_percent/100)
where department=p_department;
commit;
dbms_output.put_line('Bonus applied to department: '||p_department);
end;
/

set serveroutput on;
exec UpdateEmployeeBonus('IT',15);
select*from employees;