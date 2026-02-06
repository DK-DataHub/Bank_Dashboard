CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FullName VARCHAR(100),
DateOfBirth DATE,
Gender CHAR(1),
City VARCHAR(50),
Country VARCHAR(50),
CustomerSince DATE
)
CREATE TABLE Accounts (
AccountID INT PRIMARY KEY,
CustomerID INT,
AccountType VARCHAR(20), -- Savings, Checking
OpenDate DATE,
Balance DECIMAL(15,2),
Status VARCHAR(20), -- Active, Dormant, Closed
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)
CREATE TABLE Transactions (
TransactionID INT PRIMARY KEY,
AccountID INT,
TransactionDate DATE,
TransactionType VARCHAR(20), -- Credit, Debit
Amount DECIMAL(15,2),
Channel VARCHAR(20), -- ATM, Online, POS
FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
)
CREATE TABLE Loans (
LoanID INT PRIMARY KEY,
CustomerID INT,
LoanType VARCHAR(30), -- Personal, Home, Auto
LoanAmount DECIMAL(15,2),
InterestRate DECIMAL(5,2),
LoanStartDate DATE,
LoanEndDate DATE,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)
CREATE TABLE Repayments (
RepaymentID INT PRIMARY KEY,
LoanID INT,
DueDate DATE,
PaymentDate DATE,
AmountPaid DECIMAL(15,2),
FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
)