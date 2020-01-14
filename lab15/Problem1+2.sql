SET SERVEROUTPUT ON;

/*DECLARE
  CURSOR student_cursor IS
    SELECT STUDENT_ID, PHONE
    FROM STUDENT.STUDENT;
    
    student_row STUDENT.STUDENT.STUDENT_ID%TYPE;
    phone_number number := 0;
BEGIN
  FOR student_row in student_cursor LOOP
    if SUBSTR(student_row.phone, 0,3) = '201' then
      --DBMS_OUTPUT.PUT_LINE(student_row.student_id);
      phone_number := phone_number + 1;
    end if;
  END LOOP;
  DBMS_OUTPUT.put_line('The amount of phone numbers with a area code of 201 is ' || phone_number);
END;*/

DECLARE
  TYPE prime_array IS VARRAY(5) OF NUMBER;
  primes prime_array := prime_array(0,0,0,0,0);
BEGIN
  primes(1) := 2;
  primes(2) := 3;
  primes(3) := 5;
  primes(4) := 7;
  primes(5) := 11;
  
  FOR i in 1..primes.count LOOP
    DBMS_OUTPUT.PUT_LINE('Prime ' || i || ': ' || primes(i));
  END LOOP;
END;