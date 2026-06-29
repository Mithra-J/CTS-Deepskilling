CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
    v_balance NUMBER;
BEGIN
    IF :NEW.TransactionType = 'Withdrawal' THEN
        SELECT Balance INTO v_balance
        FROM Accounts WHERE AccountID = :NEW.AccountID;
        
        IF v_balance < :NEW.Amount THEN
            RAISE_APPLICATION_ERROR(-20004, 'Withdrawal exceeds balance');
        END IF;
    ELSIF :NEW.TransactionType = 'Deposit' THEN
        IF :NEW.Amount <= 0 THEN
            RAISE_APPLICATION_ERROR(-20005, 'Deposit must be positive');
        END IF;
    END IF;
END;
/

-- Test valid deposit
INSERT INTO Transactions VALUES (4, 1, SYSDATE, 100, 'Deposit');
-- Test invalid withdrawal (will fail)
INSERT INTO Transactions VALUES (5, 2, SYSDATE, 999999, 'Withdrawal');