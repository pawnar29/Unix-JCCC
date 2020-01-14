SET SERVEROUTPUT ON;

DECLARE
  dummy_var VARCHAR2(3);
BEGIN
  
--Duplicate value in the index
-- There is a constraint that the private key is the employee_id, this will only work when the private key is put in place
  --INSERT INTO EMPLOYEE_COPY VALUES(1, 'BILL', 35000, 'DBA');
  
--No data found error
  /*SELECT name
  INTO dummy_var
  FROM employee_copy
  where NAME = '';*/

-- Divide by zero
  --DBMS_OUTPUT.put_line(10/0);

-- Invalid Number
  /*INSERT INTO employee_copy
  VALUES('ABC','Sally', 'abc', 'President');*/
  
--Value Error
    dummy_var := 'abc123';
  
EXCEPTION
WHEN DUP_VAL_ON_INDEX THEN
  DBMS_OUTPUT.PUT_LINE('There is a duplicate value on an index');
WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('There is no data found');
WHEN ZERO_DIVIDE THEN
  DBMS_OUTPUT.PUT_LINE('Trying to divide by Zero');
WHEN INVALID_NUMBER THEN
  DBMS_OUTPUT.PUT_LINE('Trying to put a number in a string');
WHEN VALUE_ERROR THEN
  DBMS_OUTPUT.PUT_LINE('There is a value error');

END;