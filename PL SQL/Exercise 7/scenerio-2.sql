CREATE OR REPLACE PACKAGE EmployeeManagement AS
    PROCEDURE HireEmployee(p_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, p_salary IN NUMBER, p_dept IN VARCHAR2);
    PROCEDURE UpdateEmployee(p_id IN NUMBER, p_position IN VARCHAR2, p_salary IN NUMBER);
    FUNCTION CalculateAnnualSalary(p_id IN NUMBER) RETURN NUMBER;
END EmployeeManagement;
/

CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS

    PROCEDURE HireEmployee(p_id IN NUMBER, p_name IN VARCHAR2, p_position IN VARCHAR2, p_salary IN NUMBER, p_dept IN VARCHAR2) AS
    BEGIN
        INSERT INTO Employees VALUES (p_id, p_name, p_position, p_salary, p_dept, SYSDATE);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Hired: ' || p_name);
    END;

    PROCEDURE UpdateEmployee(p_id IN NUMBER, p_position IN VARCHAR2, p_salary IN NUMBER) AS
    BEGIN
        UPDATE Employees SET Position = p_position, Salary = p_salary WHERE EmployeeID = p_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Updated employee: ' || p_id);
    END;

    FUNCTION CalculateAnnualSalary(p_id IN NUMBER) RETURN NUMBER AS
        v_salary NUMBER;
    BEGIN
        SELECT Salary * 12 INTO v_salary FROM Employees WHERE EmployeeID = p_id;
        RETURN v_salary;
    END;

END EmployeeManagement;
/

-- Test
SET SERVEROUTPUT ON;
EXEC EmployeeManagement.HireEmployee(3, 'Carol White', 'Analyst', 55000, 'Finance');
SELECT EmployeeManagement.CalculateAnnualSalary(1) AS AnnualSalary FROM DUAL;