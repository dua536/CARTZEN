
 
DESC C##CARTZEN.users;





-- =====================================================
-- 3. CHECK ALL USERS (ADMIN VIEW - SYSTEM)
-- =====================================================
SELECT username FROM dba_users ORDER BY username;

-- =====================================================
-- 4. CHECK YOUR USER EXISTS
-- =====================================================
SELECT username 
FROM dba_users 
WHERE username = 'C##CARTZEN';

-- =====================================================
-- 5. CHECK TABLES OF YOUR USER
-- =====================================================
SELECT table_name 
FROM dba_tables 
WHERE owner = 'C##CARTZEN';


-- =====================================================
-- 7. CHECK SYSTEM PRIVILEGES
-- =====================================================
SELECT * FROM dba_sys_privs WHERE grantee = 'C##CARTZEN';


-- =====================================================
-- =====================================================
-- 4. CREATE COMMON USER (YOU DID THIS)
-- =====================================================
-- =====================================================
CREATE USER C##TEST IDENTIFIED BY 1234;

-- =====================================================
-- 5. GRANT BASIC PRIVILEGES
-- =====================================================
GRANT CONNECT, RESOURCE TO C##TEST;

-- Allow table usage
ALTER USER C##TEST QUOTA UNLIMITED ON USERS;

-- =====================================================
-- 6. VERIFY USER EXISTS
-- =====================================================
SELECT username FROM dba_users WHERE username = 'C##TEST';