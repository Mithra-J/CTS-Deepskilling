-- Create audit table first
CREATE TABLE AuditLog (
    AuditID       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    TransactionID NUMBER,
    AccountID     NUMBER,
    Amount        NUMBER,
    TransactionType VARCHAR2(10),
    LogDate       DATE
);

CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (TransactionID, AccountID, Amount, TransactionType, LogDate)
    VALUES (:NEW.TransactionID, :NEW.AccountID, :NEW.Amount, :NEW.TransactionType, SYSDATE);
END;
/

-- Test
INSERT INTO Transactions VALUES (3, 1, SYSDATE, 500, 'Deposit');
SELECT * FROM AuditLog;