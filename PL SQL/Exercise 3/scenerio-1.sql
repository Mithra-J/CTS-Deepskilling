create or replace procedure ProcessMonthlyInterest as
begin
update Accounts set Balance=Balance+(Balance*0.01),
LASTMODIFIED=sysdate where AccountType='Savings';
commit;
dbms_output.put_line('Monthly interest applied to all savings accounts');
end;
/

set serveroutput on;
exec ProcessMonthlyInterest;

select*from Accounts;