alter table Customers add IsVIP varchar2(5) default 'FALSE';
set serveroutput on;
begin
for i in (select CustomerID,Name,Balance from Customers)
loop
if i.Balance>10000 then
update Customers
set IsVIP='TRUE'
where CustomerID=i.CustomerID;
dbms_output.put_line(i.Name|| ' marked as VIP');
end if;
end loop;
commit;
end;
/