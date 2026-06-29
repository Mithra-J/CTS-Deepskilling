CREATE OR REPLACE PACKAGE AccountOperations AS
    PROCEDURE OpenAccount(p_account_id IN NUMBER, p_customer_id IN NUMBER, p_type IN VARCHAR2, p_balance IN NUMBER);
    PROCEDURE CloseAccount(p_account_id IN NUMBER);
    FUNCTION GetTotalBalance(p_customer_id IN NUMBER) RETURN NUMBER;
END AccountOperations;
/

CREATE OR REPLACE PACKAGE BODY AccountOperations AS

    PROCEDURE OpenAccount(p_account_id IN NUMBER, p_customer_id IN NUMBER, p_type IN VARCHAR2, p_balance IN NUMBER) AS
    BEGIN
        INSERT INTO Accounts VALUES (p_account_id, p_customer_id, p_type, p_balance, SYSDATE);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Account opened: ' || p_account_id);
    END;

    PROCEDURE CloseAccount(p_account_id IN NUMBER) AS
    BEGIN
        DELETE FROM Accounts WHERE AccountID = p_account_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Account closed: ' || p_account_id);
    END;

    FUNCTION GetTotalBalance(p_customer_id IN NUMBER) RETURN NUMBER AS
        v_total NUMBER;
    BEGIN
        SELECT SUM(Balance) INTO v_total FROM Accounts WHERE CustomerID = p_customer_id;
        RETURN NVL(v_total, 0);
    END;

END AccountOperations;
/

-- Test
SET SERVEROUTPUT ON;
EXEC AccountOperations.OpenAccount(4, 1, 'Savings', 2000);
SELECT AccountOperations.GetTotalBalance(1) AS TotalBalance FROM DUAL;
EXEC AccountOperations.CloseAccount(4);