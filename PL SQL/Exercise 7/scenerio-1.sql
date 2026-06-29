-- Package Specification (like an interface — declares what's available)
CREATE OR REPLACE PACKAGE CustomerManagement AS
    PROCEDURE AddCustomer(p_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE, p_balance IN NUMBER);
    PROCEDURE UpdateCustomer(p_id IN NUMBER, p_name IN VARCHAR2, p_balance IN NUMBER);
    FUNCTION GetCustomerBalance(p_id IN NUMBER) RETURN NUMBER;
END CustomerManagement;
/

-- Package Body (actual implementation)
CREATE OR REPLACE PACKAGE BODY CustomerManagement AS

    PROCEDURE AddCustomer(p_id IN NUMBER, p_name IN VARCHAR2, p_dob IN DATE, p_balance IN NUMBER) AS
    BEGIN
        INSERT INTO Customers VALUES (p_id, p_name, p_dob, p_balance, SYSDATE, 'FALSE');
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Added customer: ' || p_name);
    END;

    PROCEDURE UpdateCustomer(p_id IN NUMBER, p_name IN VARCHAR2, p_balance IN NUMBER) AS
    BEGIN
        UPDATE Customers SET Name = p_name, Balance = p_balance WHERE CustomerID = p_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Updated customer: ' || p_id);
    END;

    FUNCTION GetCustomerBalance(p_id IN NUMBER) RETURN NUMBER AS
        v_balance NUMBER;
    BEGIN
        SELECT Balance INTO v_balance FROM Customers WHERE CustomerID = p_id;
        RETURN v_balance;
    END;

END CustomerManagement;
/

-- Test
SET SERVEROUTPUT ON;
EXEC CustomerManagement.AddCustomer(5, 'New Customer', TO_DATE('2000-01-01','YYYY-MM-DD'), 3000);
EXEC CustomerManagement.UpdateCustomer(5, 'Updated Name', 5000);
SELECT CustomerManagement.GetCustomerBalance(5) AS Balance FROM DUAL;