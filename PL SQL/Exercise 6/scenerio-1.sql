SET SERVEROUTPUT ON;

DECLARE
    CURSOR GenerateMonthlyStatements IS
        SELECT t.TransactionID, c.Name, t.Amount, t.TransactionType, t.TransactionDate
        FROM Transactions t
        JOIN Accounts a ON t.AccountID = a.AccountID
        JOIN Customers c ON a.CustomerID = c.CustomerID
        WHERE EXTRACT(MONTH FROM t.TransactionDate) = EXTRACT(MONTH FROM SYSDATE)
          AND EXTRACT(YEAR FROM t.TransactionDate)  = EXTRACT(YEAR FROM SYSDATE);
    
    v_rec GenerateMonthlyStatements%ROWTYPE;
BEGIN
    OPEN GenerateMonthlyStatements;
    LOOP
        FETCH GenerateMonthlyStatements INTO v_rec;
        EXIT WHEN GenerateMonthlyStatements%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Customer: ' || v_rec.Name || 
            ' | Type: ' || v_rec.TransactionType ||
            ' | Amount: ' || v_rec.Amount ||
            ' | Date: ' || TO_CHAR(v_rec.TransactionDate, 'DD-MON-YYYY'));
    END LOOP;
    CLOSE GenerateMonthlyStatements;
END;
/