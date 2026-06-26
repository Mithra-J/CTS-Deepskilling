set severoutput on;
begin
for i in 
(select l.LoanID,c,Naame,l.EndDate from Loans l join Customers c on l.CustomerID=c.CustomerID
where l.EndDate between sysdate and sysdate+30) loop
dbms_output.put_line('Reminder: ' ||i.Name||' - Loan '||i.LoanID||' due on '||to_char(i.EndDate,'dd-mon-YYYY'));
end loop;
end;
/