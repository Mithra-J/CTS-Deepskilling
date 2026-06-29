CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
    p_loan_amount IN NUMBER,
    p_interest_rate IN NUMBER,  -- annual %
    p_years IN NUMBER
) RETURN NUMBER AS
    v_monthly_rate NUMBER;
    v_months       NUMBER;
    v_emi          NUMBER;
BEGIN
    v_monthly_rate := p_interest_rate / (12 * 100);
    v_months       := p_years * 12;
    -- EMI formula: P * r * (1+r)^n / ((1+r)^n - 1)
    v_emi := p_loan_amount * v_monthly_rate * 
             POWER(1 + v_monthly_rate, v_months) /
             (POWER(1 + v_monthly_rate, v_months) - 1);
    RETURN ROUND(v_emi, 2);
END;
/

-- Test
SET SERVEROUTPUT ON;
SELECT CalculateMonthlyInstallment(5000, 5, 5) AS Monthly_EMI FROM DUAL;