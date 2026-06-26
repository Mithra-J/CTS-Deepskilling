create or replace procedure SafeTransferFunds(
    p_from_account in number,
    p_to_account in number,
    p_amount in number
) as v_balance number;

begin
select Balance into v_balance from accounts where AccountID=p_from_account;
if v_balance<p_amount then 
raise_application_error(-20001,'Insufficient funds');
end if;

update Accounts set balance = balance-p_amount
where AccountID=p_from_account;

update Accounts set balance=balance+p_amount
where accountID=p_to_account;

commit;
dbms_output.put_line('Transfer successful: '||p_amount);
exception
when others then rollback;
dbms_output.put_line('Transfer failed: '||sqlerrm);
end;
/

set serveroutput on;
exec SafeTransferFunds(1,2,500);
exec SafeTransferFunds(2,1,99999);