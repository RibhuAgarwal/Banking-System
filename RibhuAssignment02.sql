-- Bank table
CREATE TABLE RABank (
    BankiD VARCHAR2(50) PRIMARY KEY,
    Name VARCHAR2(255),
    PinCode VARCHAR2(10),
    City VARCHAR2(255)
);


-- Manager table
CREATE TABLE RAManager (
    ManagerId NUMBER PRIMARY KEY,
    FName VARCHAR2(255),
    LName VARCHAR2(255),
    PinCode VARCHAR2(10),
    City VARCHAR2(255)
);


-- Employee table
CREATE TABLE RAEmployees (
    EmployeeID NUMBER PRIMARY KEY,
    DOB DATE,
    HireDate DATE,
    Position VARCHAR2(255),
    FName VARCHAR2(255),
    LName VARCHAR2(255),
    PinCode VARCHAR2(10),
    City VARCHAR2(255)
);


-- Branch table
CREATE TABLE RABranch (
    BranchId VARCHAR2(50) PRIMARY KEY,
    BranchName VARCHAR2(255),
    Pincode VARCHAR2(10),
    City VARCHAR2(255),
    Manager NUMBER,
    FOREIGN KEY (Manager) REFERENCES RAManager (ManagerId)
);




-- Client table
CREATE TABLE RAClient (
    ClientId NUMBER PRIMARY KEY,
    Email VARCHAR2(255),
    SIN VARCHAR2(255),
    FName VARCHAR2(255),
    LName VARCHAR2(255),
    DOB DATE,
    PinCode VARCHAR2(10),
    City VARCHAR2(255),
    Branch VARCHAR2(50),
    FOREIGN KEY (Branch) REFERENCES RABranch (BranchId)
);



-- Nominee table (Weak Entity)
CREATE TABLE RANominee (
    NomineeId NUMBER PRIMARY KEY,
    Email VARCHAR2(255),
    SIN VARCHAR2(255),
    FName VARCHAR2(255),
    LName VARCHAR2(255),
    PinCode VARCHAR2(10),
    City VARCHAR2(255)
);

-- Account table
CREATE TABLE RAAccount (
    AccountNumber NUMBER PRIMARY KEY,
    AccountType VARCHAR2(255),
    DateOpen DATE,
    BalanceD DECIMAL(10, 2),
    NomineeId NUMBER,
    FOREIGN KEY (NomineeId) REFERENCES RANominee (NomineeId)
);

-- Client-Phone table for storing multiple phone numbers for clients
CREATE TABLE RAClientPhone (
    ClientId NUMBER,
    PhoneNumber VARCHAR2(20),
    PRIMARY KEY (ClientId, PhoneNumber),
    FOREIGN KEY (ClientId) REFERENCES RAClient (ClientId)
);

-- Employee-Phone table for storing multiple phone numbers for employees
CREATE TABLE RAEmployeePhone (
    EmployeeID NUMBER,
    PhoneNumber VARCHAR2(20),
    PRIMARY KEY (EmployeeID, PhoneNumber),
    FOREIGN KEY (EmployeeID) REFERENCES RAEmployees (EmployeeID)
);

-- Manager-Phone table for storing multiple phone numbers for managers
CREATE TABLE RAManagerPhone (
    ManagerId NUMBER,
    PhoneNumber VARCHAR2(20),
    PRIMARY KEY (ManagerId, PhoneNumber),
    FOREIGN KEY (ManagerId) REFERENCES RAManager (ManagerId)
);


-- Nominee-Phone table for storing multiple phone numbers for nominees
CREATE TABLE RANomineePhone (
    NomineeId NUMBER,
    PhoneNumber VARCHAR2(20),
    PRIMARY KEY (NomineeId, PhoneNumber),
    FOREIGN KEY (NomineeId) REFERENCES RANominee (NomineeId)
);


-- One Client has many Account (Many to many)
CREATE TABLE RAClientAccount (
    ClientId NUMBER,   -- Foreign key to Client table
    AccountNumber NUMBER,   -- Foreign key to Account table
    PRIMARY KEY (ClientId, AccountNumber),
    FOREIGN KEY (ClientId) REFERENCES RAClient (ClientId),
    FOREIGN KEY (AccountNumber) REFERENCES RAAccount (AccountNumber)
);

Select * from RAClientAccount;


-----Entries for Bank-----
-- Inserting the data in the table --
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (1, 'State Bank of India', '110001', 'New Delhi');    
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (2, 'HDFC Bank', '400001', 'Mumbai');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (3, 'ICICI Bank', '560001', 'Bangalore');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (4, 'Axis Bank', '700001', 'Kolkata');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (5, 'Punjab National Bank', '110002', 'New Delhi');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (6, 'Canara Bank', '560002', 'Bangalore');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (7, 'Royal Bank of Canada', 'M5V 1J4', 'Toronto');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (8, 'Toronto-Dominion Bank', 'M5K 1A2', 'Toronto');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (9, 'Scotiabank', 'M5H 1H1', 'Toronto');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (10, 'Bank of Montreal', 'H2Y 1H1', 'Montreal');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (11, 'Canadian Imperial Bank of Commerce', 'M5K 1A2', 'Toronto');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (12, 'National Bank of Canada', 'H2Y 1H2', 'Montreal');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (13, 'HSBC Bank Canada', 'V6C 2T1', 'Vancouver');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (14, 'Desjardins Group', 'H2Y 1H2', 'Montreal');
INSERT INTO RABank (BankiD, Name, PinCode, City) VALUES (15, 'Canadian Western Bank', 'T5J 0L2', 'Edmonton');


-- Show all data in the table --
SELECT * FROM RABANK;  



----- Entries for Manager -----
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (1, 'Rajesh', 'Sharma', '110001', 'New Delhi');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (2, 'Sunita', 'Verma', '400001', 'Mumbai');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (3, 'Amit', 'Patel', '560001', 'Bangalore');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (4, 'Priya', 'Banerjee', '700001', 'Kolkata');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (5, 'Anil', 'Gupta', '110002', 'New Delhi');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (6, 'Neha', 'Kumar', '560002', 'Bangalore');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (7, 'John', 'Smith', 'M5V 1J4', 'Toronto');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (8, 'Emily', 'Johnson', 'M5K 1A2', 'Toronto');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (9, 'David', 'Anderson', 'M5H 1H1', 'Toronto');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (10, 'Sophie', 'Martin', 'H2Y 1H1', 'Montreal');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (11, 'Michael', 'Wilson', 'M5K 1A2', 'Toronto');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (12, 'Isabelle', 'Lavoie', 'H2Y 1H2', 'Montreal');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (13, 'Daniel', 'Brown', 'V6C 2T1', 'Vancouver');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (14, 'Marie', 'Tremblay', 'H2Y 1H2', 'Montreal');
INSERT INTO RAManager (ManagerId, FName, LName, PinCode, City) VALUES (15, 'William', 'Jones', 'T5J 0L2', 'Edmonton');





SELECT * FROM RAMANAGER;


----- Entries for Employees ------
INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (1, TO_DATE('1980-05-15', 'YYYY-MM-DD'), TO_DATE('2020-02-10', 'YYYY-MM-DD'), 'Cashier', 'Amit', 'Kumar', '110001', 'New Delhi');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (2, TO_DATE('1985-08-25', 'YYYY-MM-DD'), TO_DATE('2019-05-20', 'YYYY-MM-DD'), 'Accountant', 'Rahul', 'Sharma', '400001', 'Mumbai');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (3, TO_DATE('1990-03-10', 'YYYY-MM-DD'), TO_DATE('2021-01-15', 'YYYY-MM-DD'), 'Customer Service Representative', 'Priya', 'Singh', '560001', 'Bangalore');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (4, TO_DATE('1988-11-02', 'YYYY-MM-DD'), TO_DATE('2018-07-05', 'YYYY-MM-DD'), 'Loan Officer', 'Rajesh', 'Verma', '700001', 'Kolkata');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (5, TO_DATE('1987-06-20', 'YYYY-MM-DD'), TO_DATE('2017-09-30', 'YYYY-MM-DD'), 'Teller', 'Neeta', 'Gupta', '110002', 'New Delhi');

INSERT INTO AEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (6, TO_DATE('1992-04-18', 'YYYY-MM-DD'), TO_DATE('2019-11-15', 'YYYY-MM-DD'), 'Customer Service Representative', 'Anil', 'Yadav', '560002', 'Bangalore');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (7, TO_DATE('1983-09-12', 'YYYY-MM-DD'), TO_DATE('2020-03-25', 'YYYY-MM-DD'), 'Cashier', 'Sarah', 'Smith', 'M5V 1J4', 'Toronto');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (8, TO_DATE('1989-07-30', 'YYYY-MM-DD'), TO_DATE('2019-06-12', 'YYYY-MM-DD'), 'Accountant', 'Daniel', 'Brown', 'V6C 2T1', 'Vancouver');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (9, TO_DATE('1991-02-14', 'YYYY-MM-DD'), TO_DATE('2021-02-18', 'YYYY-MM-DD'), 'Customer Service Representative', 'Jessica', 'Martin', 'M5K 1A2', 'Toronto');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (10, TO_DATE('1986-10-05', 'YYYY-MM-DD'), TO_DATE('2018-04-10', 'YYYY-MM-DD'), 'Loan Officer', 'David', 'Anderson', 'M5H 1H1', 'Toronto');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (11, TO_DATE('1993-03-22', 'YYYY-MM-DD'), TO_DATE('2020-09-15', 'YYYY-MM-DD'), 'Teller', 'Emily', 'Johnson', 'M5K 1A2', 'Toronto');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (12, TO_DATE('1994-12-10', 'YYYY-MM-DD'), TO_DATE('2019-08-02', 'YYYY-MM-DD'), 'Cashier', 'Michael', 'Wilson', 'H2Y 1H1', 'Montreal');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (13, TO_DATE('1990-07-28', 'YYYY-MM-DD'), TO_DATE('2020-07-05', 'YYYY-MM-DD'), 'Accountant', 'Isabelle', 'Lavoie', 'H2Y 1H2', 'Montreal');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (14, TO_DATE('1987-05-15', 'YYYY-MM-DD'), TO_DATE('2018-11-20', 'YYYY-MM-DD'), 'Customer Service Representative', 'Sophie', 'Gagnon', 'H2Y 1H2', 'Montreal');

INSERT INTO RAEmployees (EmployeeID, DOB, HireDate, Position, FName, LName, PinCode, City)
VALUES (15, TO_DATE('1982-08-28', 'YYYY-MM-DD'), TO_DATE('2019-04-30', 'YYYY-MM-DD'), 'Loan Officer', 'William', 'Jones', 'T5J 0L2', 'Edmonton');




----- Entries for Branch -----
INSERT ALL
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (1, 'Main Branch', '110001', 'New Delhi', 1)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (2, 'Downtown Branch', '400001', 'Mumbai', 2)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (3, 'Tech Park Branch', '560001', 'Bangalore', 3)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (4, 'Central Branch', '700001', 'Kolkata', 4)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (5, 'North Branch', '110002', 'New Delhi', 5)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (6, 'Silicon Valley Branch', '560002', 'Bangalore', 6)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (7, 'Downtown Toronto Branch', 'M5V 1J4', 'Toronto', 7)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (8, 'Financial District Branch', 'M5K 1A2', 'Toronto', 8)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (9, 'Financial Hub Branch', 'M5H 1H1', 'Toronto', 9)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (10, 'Downtown Montreal Branch', 'H2Y 1H1', 'Montreal', 10)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (11, 'Bay Street Branch', 'M5K 1A2', 'Toronto', 11)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (12, 'Old Montreal Branch', 'H2Y 1H2', 'Montreal', 12)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (13, 'Vancouver Downtown Branch', 'V6C 2T1', 'Vancouver', 13)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (14, 'Montreal Financial District Branch', 'H2Y 1H2', 'Montreal', 14)
INTO RABranch (BranchId, BranchName, Pincode, City, Manager)
VALUES (15, 'Edmonton Central Branch', 'T5J 0L2', 'Edmonton', 15)
SELECT * FROM DUAL;


----- Entries for client -----

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (1, 'john.doe@example.com', '123-45-6789', 'John', 'Doe', TO_DATE('1988-03-15', 'YYYY-MM-DD'), '110001', 'New Delhi', 1);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (2, 'jane.smith@example.com', '987-65-4321', 'Jane', 'Smith', TO_DATE('1990-07-20', 'YYYY-MM-DD'), '400001', 'Mumbai', 2);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (3, 'amit.patil@example.com', '456-78-9123', 'Amit', 'Patil', TO_DATE('1985-09-10', 'YYYY-MM-DD'), '560001', 'Bangalore', 3);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (4, 'sneha.verma@example.com', '789-12-3456', 'Sneha', 'Verma', TO_DATE('1992-01-25', 'YYYY-MM-DD'), '700001', 'Kolkata', 4);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (5, 'kunal.gupta@example.com', '234-56-7890', 'Kunal', 'Gupta', TO_DATE('1987-11-05', 'YYYY-MM-DD'), '110002', 'New Delhi', 5);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (6, 'neha.kumar@example.com', '678-90-1234', 'Neha', 'Kumar', TO_DATE('1994-04-18', 'YYYY-MM-DD'), '560002', 'Bangalore', 6);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (7, 'david.anderson@example.com', '789-01-2345', 'David', 'Anderson', TO_DATE('1982-08-12', 'YYYY-MM-DD'), 'M5V 1J4', 'Toronto', 7);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (8, 'sarah.johnson@example.com', '345-67-8901', 'Sarah', 'Johnson', TO_DATE('1986-12-02', 'YYYY-MM-DD'), 'M5K 1A2', 'Toronto', 8);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (9, 'jessica.martin@example.com', '567-89-0123', 'Jessica', 'Martin', TO_DATE('1991-03-20', 'YYYY-MM-DD'), 'M5H 1H1', 'Toronto', 9);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (10, 'daniel.brown@example.com', '123-45-6789', 'Daniel', 'Brown', TO_DATE('1987-05-15', 'YYYY-MM-DD'), 'H2Y 1H1', 'Montreal', 10);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (11, 'emily.wilson@example.com', '890-12-3456', 'Emily', 'Wilson', TO_DATE('1993-09-10', 'YYYY-MM-DD'), 'M5K 1A2', 'Toronto', 11);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (12, 'michael.tremblay@example.com', '567-89-0123', 'Michael', 'Tremblay', TO_DATE('1995-01-25', 'YYYY-MM-DD'), 'H2Y 1H2', 'Montreal', 12);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (13, 'marie.gagnon@example.com', '234-56-7890', 'Marie', 'Gagnon', TO_DATE('1990-11-05', 'YYYY-MM-DD'), 'V6C 2T1', 'Vancouver', 13);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (14, 'william.jones@example.com', '678-90-1234', 'William', 'Jones', TO_DATE('1986-04-18', 'YYYY-MM-DD'), 'T5J 0L2', 'Edmonton', 14);

INSERT INTO RAClient (ClientId, Email, SIN, FName, LName, DOB, PinCode, City, Branch)
VALUES (15, 'sophie.lavoie@example.com', '789-01-2345', 'Sophie', 'Lavoie', TO_DATE('1994-08-12', 'YYYY-MM-DD'), 'H2Y 1H2', 'Montreal', 15);

SELECT * FROM RACLIENT;


----- Entries for Nominee -----

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (1, 'alice@protonmail.com', '111-222-333', 'Alice', 'Johnson', '110001', 'New Delhi');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (2, 'bob@protonmail.com', '222-333-444', 'Bob', 'Smith', '400001', 'Mumbai');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (3, 'carol@protonmail.com', '333-444-555', 'Carol', 'Brown', '560001', 'Bangalore');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (4, 'david@protonmail.com', '444-555-666', 'David', 'Wilson', '700001', 'Kolkata');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (5, 'ella@protonmail.com', '555-666-777', 'Ella', 'Garcia', '110002', 'New Delhi');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (6, 'frank@gmail.com', '666-777-888', 'Frank', 'Lee', '560002', 'Bangalore');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (7, 'grace@gmail.com', '777-888-999', 'Grace', 'Chen', 'M5V 1J4', 'Toronto');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (8, 'hank@gmail.com', '888-999-000', 'Hank', 'Wong', 'V6C 2T1', 'Vancouver');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (9, 'kim@gmail.com', '999-000-111', 'Ivy', 'Kim', 'M5K 1A2', 'Toronto');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (10, 'jack@gmail.com', '000-111-222', 'Jack', 'Liu', 'M5H 1H1', 'Toronto');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (11, 'katie@protonmail.com', '111-222-333', 'Katie', 'Nguyen', 'H2Y 1H1', 'Montreal');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (12, 'leo@gmail.com', '222-333-444', 'Leo', 'Martinez', 'H2Y 1H2', 'Montreal');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (13, 'mia@protonmail.com', '333-444-555', 'Mia', 'Thompson', 'V6C 2T1', 'Vancouver');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (14, 'nathan@gmail.com', '444-555-666', 'Nathan', 'Hall', 'H2Y 1H2', 'Montreal');

INSERT INTO RANominee (NomineeId, Email, SIN, FName, LName, PinCode, City)
VALUES (15, 'brown@protonmail.com', '555-666-777', 'Olivia', 'Brown', 'T5J 0L2', 'Edmonton');

Select * from RANominee;

----- Entries for account -----
-- Another way of inserting data insert multiple data at a time --
INSERT ALL                  
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (101, 'Savings', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 5000.00, 1, 1)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (102, 'Checking', TO_DATE('2023-02-20', 'YYYY-MM-DD'), 2500.00, 2, 2)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (103, 'Savings', TO_DATE('2023-03-10', 'YYYY-MM-DD'), 7000.00, 3, 3)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (104, 'Checking', TO_DATE('2023-04-05', 'YYYY-MM-DD'), 3000.00, 4, 4)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (105, 'Savings', TO_DATE('2023-05-20', 'YYYY-MM-DD'), 6000.00, 5, 5)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (106, 'Checking', TO_DATE('2023-06-15', 'YYYY-MM-DD'), 4000.00, 6, 6)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (107, 'Savings', TO_DATE('2023-07-10', 'YYYY-MM-DD'), 8000.00, 7, 7)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (108, 'Checking', TO_DATE('2023-08-25', 'YYYY-MM-DD'), 3500.00, 8, 8)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (109, 'Savings', TO_DATE('2023-09-30', 'YYYY-MM-DD'), 9000.00, 9, 9)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (110, 'Checking', TO_DATE('2023-10-15', 'YYYY-MM-DD'), 4500.00, 10, 10)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (111, 'Savings', TO_DATE('2023-11-10', 'YYYY-MM-DD'), 9500.00, 11, 11)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (112, 'Checking', TO_DATE('2023-12-05', 'YYYY-MM-DD'), 5500.00, 12, 12)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (113, 'Savings', TO_DATE('2024-01-20', 'YYYY-MM-DD'), 11000.00, 13, 13)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (114, 'Checking', TO_DATE('2024-02-15', 'YYYY-MM-DD'), 6200.00, 14, 14)
INTO RAAccount (AccountNumber, AccountType, DateOpen, Balanced, Client, NomineeID)
VALUES (115, 'Savings', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 7500.00, 15, 15)
SELECT * FROM DUAL;




----- Entries for AccountCLient Relation -----
INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (1, 101);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (2, 102);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (3, 103);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (4, 104);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (5, 105);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (6, 106);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (7, 107);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (8, 108);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (9, 109);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (10, 110);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (11, 111);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (12, 112);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (13, 113);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (14, 114);

INSERT INTO RAClientAccount (ClientId, AccountNumber)
VALUES (15, 115);



----- Manager Phone number -----
INSERT INTO ManagerPhone (ManagerId, PhoneNumber)
VALUES (1, '123-456-7890');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (1, '987-654-3210');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (2, '555-555-5555');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (3, '111-222-3333');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (3, '444-555-6666');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (4, '777-888-9999');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (5, '333-222-1111');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (6, '888-777-6666');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (7, '555-123-4567');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (8, '111-999-8888');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (9, '666-999-4444');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (10, '123-789-4561');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (11, '777-555-1111');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (12, '999-444-6666');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (13, '123-987-6543');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (14, '123-859-7452');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (15, '123-554-9684');

INSERT INTO RAManagerPhone (ManagerId, PhoneNumber)
VALUES (15, '123-987-9684');


select * from ramanagerphone;



-- RANomineePhone Entries
INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (1, '123-456-7890');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (1, '987-654-3210');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (2, '555-555-5555');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (3, '111-222-3333');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (3, '444-555-6666');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (4, '777-888-9999');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (5, '333-222-1111');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (6, '888-777-6666');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (7, '555-123-4567');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (8, '111-999-8888');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (9, '666-999-4444');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (10, '123-789-4561');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (11, '777-555-1111');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (12, '999-444-6666');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (13, '123-987-6543');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (14, '554-444-7854');

INSERT INTO RANomineePhone (NomineeId, PhoneNumber)
VALUES (15, '123-879-2665');



-- RAEmployeePhone Entries
INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (1, '123-456-7890');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (1, '987-654-3210');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (2, '555-555-5555');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (3, '111-222-3333');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (3, '444-555-6666');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (4, '777-888-9999');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (5, '333-222-1111');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (6, '888-777-6666');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (7, '555-123-4567');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (8, '111-999-8888');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (9, '666-999-4444');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (10, '123-789-4561');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (11, '777-555-1111');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (12, '999-444-6666');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (13, '123-987-6543');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (14, '999-783-9858');

INSERT INTO RAEmployeePhone (EmployeeID, PhoneNumber)
VALUES (15, '123-857-7866');


-- RAClientPhone Entries
INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (1, '123-456-7890');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (1, '987-654-3210');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (2, '555-555-5555');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (3, '111-222-3333');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (3, '444-555-6666');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (4, '777-888-9999');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (5, '333-222-1111');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (6, '888-777-6666');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (7, '555-123-4567');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (8, '111-999-8888');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (9, '666-999-4444');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (10, '123-789-4561');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (11, '777-555-1111');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (15, '999-615-5415');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (14, '123-457-6543');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (12, '999-444-6666');

INSERT INTO RAClientPhone (ClientId, PhoneNumber)
VALUES (13, '123-987-6543');


----- Using alter table add column ----
-- Alter the table and  add new attribute --
ALTER TABLE RAAccount              
ADD CLIENT NUMBER;


-- Alter table and add foreign key inside the table --
ALTER TABLE RAAccount
ADD CONSTRAINT fk_client                    
FOREIGN KEY (Client)
REFERENCES RAClient (ClientId);


-- Bank to Branch 
ALTER TABLE RABranch
ADD BankId varchar2(50);
ALTER TABLE RABranch
ADD FOREIGN KEY (BankId) REFERENCES RABank (BankId);

-- Updating BankId for multiple Brancheid
-- Updata the data in side the table --
UPDATE RABranch                    
SET BankId = 1
WHERE BranchId IN (1, 2, 3, 4, 5, 6, 7, 15);

UPDATE RABranch
SET BankId = 2
WHERE BranchId IN (8, 9, 10, 11, 12, 13, 14);

select * from RABranch;

-- Branch to Client (One-to-Many)
ALTER TABLE RAClient
ADD BranhID varchar2(50);


------------------Rename-----------------
ALTER TABLE RAClient                
RENAME COLUMN BranhID TO BranchId;

ALTER TABLE RAClient
ADD FOREIGN KEY (BranchId) REFERENCES RABranch (BranchId);

-- Updating RAClient for multiple Brancheid
UPDATE RAClient
SET BranchId = 1
WHERE ClientID IN (1, 2, 3, 4, 5, 6, 7, 15);

UPDATE RAClient
SET BranchId = 2
WHERE ClientID IN (8, 9, 10, 11, 12, 13, 14);


-- Branch to Employee (One-to-Many)
ALTER TABLE RAEmployees
ADD BranchID varchar2(50);

ALTER TABLE RAEmployees
ADD FOREIGN KEY (BranchID) REFERENCES RABranch (BranchID);

-- Updating RAEmployees for multiple Brancheid --
UPDATE RAEmployees     
SET BranchID = 1
WHERE EmployeeID IN (1, 2, 3, 4, 5, 6, 7, 15);

UPDATE RAEmployees
SET BranchID = 2
WHERE EmployeeID IN (8, 9, 10, 11, 12, 13, 14);



-- Select Distinct --
SELECT DISTINCT City FROM RABank;

-- Where
SELECT * FROM RABranch WHERE City = 'New Delhi';

-- Order By --
SELECT * FROM RAClient ORDER BY ClientID;

-- And / Or / Not --
SELECT * FROM RABranch WHERE City = 'New Delhi' AND (PinCode = '110001' OR PinCode = '700001');

SELECT * FROM RABank WHERE NOT City = 'New Delhi';


--Delete --
DELETE FROM RAEmployeephone WHERE Employeeid = '7';

-- Select Top --
SELECT * FROM RAClient ORDER BY FName FETCH FIRST 10 ROWS ONLY;

-- Min and Max --
SELECT MIN(BalanceD) AS SmallestBalance, MAX(BalanceD) AS LargestBalance FROM RAAccount;

-- Count --
SELECT COUNT (*) FROM RAClient;

-- Sum --
SELECT SUM(BalanceD) FROM RAAccount;

-- Avg --
SELECT AVG(BalanceD) FROM RAAccount;

-- Like --
SELECT * FROM RAClient WHERE FName LIKE 'A%';

-- Wildcards --
SELECT * FROM RAManager WHERE FName LIKE 'A%';

-- In --
SELECT * FROM RAClient WHERE City IN ('Vancouver', 'New Delhi', 'Mumbai');

-- Between --
SELECT * FROM RAEmployees WHERE DOB BETWEEN TO_DATE('1980-01-01', 'YYYY-MM-DD') AND TO_DATE('1990-12-31', 'YYYY-MM-DD');

-- Aliases --
SELECT FName AS FirstName, LName AS LastName FROM RAClient;


-- Inner Join --
SELECT RAClient.FName, RAClient.LName, RABranch.BranchName
FROM RAClient
INNER JOIN RABranch ON RAClient.BranchId = RABranch.BranchId;

-- Union --
SELECT FName FROM RAClient
UNION
SELECT FName FROM RAEmployees;

--Group By --
SELECT City, COUNT(*) AS NumberOfClients FROM RAClient GROUP BY City;
 
--  Having --
SELECT City, COUNT(*) AS NumberOfClients FROM RAClient GROUP BY City HAVING COUNT(*) > 2;

-- Exists --
SELECT * FROM RABank WHERE EXISTS (SELECT * FROM RABranch WHERE RABank.BankiD = RABranch.BankId);


-- Null Functions --
SELECT COALESCE(FName, 'Unknown') FROM RAClient;


-- Inner Join --
SELECT 
    e.FName AS EmployeeFirstName, 
    e.LName AS EmployeeLastName, 
    b.BranchName 
FROM RAEmployees e
INNER JOIN RABranch b ON e.BranchID = b.BranchId;

-- Left Join --
SELECT 
    c.FName AS ClientFirstName, 
    c.LName AS ClientLastName, 
    b.BranchName 
FROM RAClient c
LEFT JOIN RABranch b ON c.BranchId = b.BranchId;

-- Right Join --
SELECT 
    c.FName AS ClientFirstName, 
    c.LName AS ClientLastName, 
    b.BranchName 
FROM RAClient c
RIGHT JOIN RABranch b ON c.BranchId = b.BranchId;

-- Full Join --
SELECT 
    c.FName AS ClientFirstName, 
    c.LName AS ClientLastName, 
    b.BranchName 
FROM RAClient c
FULL OUTER JOIN RABranch b ON c.BranchId = b.BranchId;



-- Cross Join --
SELECT 
    c.FName AS ClientFirstName, 
    c.LName AS ClientLastName, 
    e.FName AS EmployeeFirstName, 
    e.LName AS EmployeeLastName 
FROM RAClient c
CROSS JOIN RAEmployees e;

-- Natural Join --
SELECT 
    *
FROM RAClient c, RABranch b
WHERE c.BranchId = b.BranchId;

-- Join with Using clause --
SELECT 
    *
FROM RAClient c
JOIN RABranch b USING (BranchId);

-- Join with ON clause --
SELECT 
    c.FName AS ClientFirstName, 
    c.LName AS ClientLastName, 
    b.BranchName 
FROM RAClient c
JOIN RABranch b ON c.BranchId = b.BranchId;


-- Using INNER JOIN to get clients who have at least one phone number --
SELECT
    c.ClientId,
    c.FName AS ClientFirstName,
    c.LName AS ClientLastName,
    cp.PhoneNumber
FROM
    RAClient c
INNER JOIN RAClientPhone cp ON c.ClientId = cp.ClientId;

-- Full outer join --
SELECT
    COALESCE(c.ManagerId, cp.ManagerId) AS ManagerId,
    c.FName AS ManagerFirstName,
    c.LName AS ManagerLastName,
    cp.PhoneNumber
FROM
    RAManager c
FULL OUTER JOIN RAManagerPhone cp ON c.ManagerId = cp.ManagerId;



--- Nested Query for average amount in the banks --
SELECT 
    b.BranchName, 
    (SELECT AVG(Balanced) FROM RAAccount WHERE AccountNumber IN 
        (SELECT AccountNumber FROM RAClientAccount WHERE ClientId IN 
            (SELECT ClientId FROM RAClient WHERE Branch = b.BranchId)
        )
    ) AS AverageBranchBalance
FROM RABranch b;

SELECT 
FName AS FirstName, LName AS LastName 
FROM RAClient WHERE ClientId IN (SELECT c.ClientId FROM RAClientAccount c INNER JOIN RAAccount a ON c.AccountNumber = a.AccountNumber
WHERE a.AccountType = 'Savings' AND a.Balanced > (SELECT AVG(Balanced) FROM RAAccount  WHERE  AccountType = 'Checking' ));

