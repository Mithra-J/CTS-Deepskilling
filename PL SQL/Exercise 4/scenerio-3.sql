CREATE OR REPLACE FUNCTION HasSufficientBalance(
    p_account_id IN NUMBER,
    p_amount     IN NUMBER
) RETURN VARCHAR2 AS
    v_balance NUMBER;
BEGIN
    SELECT Balance INTO v_balance
    FROM Accounts WHERE AccountID = p_account_id;
    
    IF v_balance >= p_amount THEN
        RETURN 'TRUE';
    ELSE
        RETURN 'FALSE';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'FALSE';
END;
/

-- Test
SET SERVEROUTPUT ON;
SELECT HasSufficientBalance(1, 500) AS Result FROM DUAL;   -- should be TRUE
SELECT HasSufficientBalance(1, 99999) AS Result FROM DUAL; -- should be FALSE