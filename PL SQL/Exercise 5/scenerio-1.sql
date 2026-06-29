CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
    :NEW.LastModified := SYSDATE;
END;
/

-- Test
UPDATE Customers SET Balance = 20000 WHERE CustomerID = 1;
SELECT CustomerID, Balance, LastModified FROM Customers;