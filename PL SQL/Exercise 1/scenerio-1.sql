set serveroutput on;
begin 
for i in (select CustomerID,Name,DOB from Customers)
loop
if months_between(sysdate,i.DOB)/12 >60 then
update Loans
set InterestRate=InterestRate-1
where CustomerID=i.customerID;
dbms_output.put_line('Discount applied for: '||i.Name);
end if;
end loop;
commit;
end;
/