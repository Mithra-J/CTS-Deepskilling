SET SERVEROUTPUT ON;

DECLARE
    CURSOR ApplyAnnualFee IS
        SELECT AccountID, Balance FROM Accounts;
    
    v_account_id Accounts.AccountID%TYPE;
    v_balance    Accounts.Balance%TYPE;
    v_fee        NUMBER := 500; -- annual fee amount
BEGIN
    OPEN ApplyAnnualFee;
    LOOP
        FETCH ApplyAnnualFee INTO v_account_id, v_balance;
        EXIT WHEN ApplyAnnualFee%NOTFOUND;
        
        UPDATE Accounts
        SET Balance = Balance - v_fee
        WHERE AccountID = v_account_id;
        
        DBMS_OUTPUT.PUT_LINE('Fee deducted from Account: ' || v_account_id);
    END LOOP;
    CLOSE ApplyAnnualFee;
    COMMIT;
END;
/