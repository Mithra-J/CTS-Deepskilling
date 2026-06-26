create or replace procedure TransferFunds(
    p_from in number,
    p_to in number,
    p_amount in number
) as v_balance number;
begin
select balance into v_balance from accounts where accountId=p_from;
if v_balance<p_amount then 
raise_application_error(-20003,'Insufficient balance');
end if;
update accounts set balance=balance-p_amount where accountid=p_from;
update accounts set balance=balance+p_amount where accountid=p_to;
commit;
dbms_output.put_line('Transferred '||p_amount||' from acccount '||p_from||' to '||p_to);

exception
when others then rollback;
dbms_output.put_line('Transfer failed: '||sqlerrm);
end;
/
set serveroutput on;
exec Transferfunds(1,2,1000);
select*from accounts;