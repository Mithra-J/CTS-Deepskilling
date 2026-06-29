SET SERVEROUTPUT ON;

DECLARE
    CURSOR UpdateLoanInterestRates IS
        SELECT LoanID, LoanAmount, InterestRate FROM Loans;
    
    v_loan_id      Loans.LoanID%TYPE;
    v_loan_amount  Loans.LoanAmount%TYPE;
    v_interest     Loans.InterestRate%TYPE;
    v_new_rate     NUMBER;
BEGIN
    OPEN UpdateLoanInterestRates;
    LOOP
        FETCH UpdateLoanInterestRates INTO v_loan_id, v_loan_amount, v_interest;
        EXIT WHEN UpdateLoanInterestRates%NOTFOUND;
        
        -- Policy: loans above 5000 get 0.5% increase, others get 0.5% decrease
        IF v_loan_amount > 5000 THEN
            v_new_rate := v_interest + 0.5;
        ELSE
            v_new_rate := v_interest - 0.5;
        END IF;
        
        UPDATE Loans SET InterestRate = v_new_rate WHERE LoanID = v_loan_id;
        DBMS_OUTPUT.PUT_LINE('Loan ' || v_loan_id || ': rate updated to ' || v_new_rate);
    END LOOP;
    CLOSE UpdateLoanInterestRates;
    COMMIT;
END;
/