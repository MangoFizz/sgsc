
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/09/2024 10:08:50
-- Generated from EDMX file: C:\Users\aiwass\source\repos\MangoFizz\sgsc\Modelsgsc.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [sgsc];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BankAccountCustomer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BankAccounts] DROP CONSTRAINT [FK_BankAccountCustomer];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerContact]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Contacts] DROP CONSTRAINT [FK_CustomerContact];
GO
IF OBJECT_ID(N'[dbo].[FK_CreditRequestCustomer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CreditRequests] DROP CONSTRAINT [FK_CreditRequestCustomer];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CustomerContactInfoes] DROP CONSTRAINT [FK_CustomerId];
GO
IF OBJECT_ID(N'[dbo].[FK_CreditRequestBankAccount]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CreditRequests] DROP CONSTRAINT [FK_CreditRequestBankAccount];
GO
IF OBJECT_ID(N'[dbo].[FK_CreditRequestBankAccount1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CreditRequests] DROP CONSTRAINT [FK_CreditRequestBankAccount1];
GO
IF OBJECT_ID(N'[dbo].[FK_CreditRequestCreditCondition_CreditRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CreditRequestCreditCondition] DROP CONSTRAINT [FK_CreditRequestCreditCondition_CreditRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_CreditRequestCreditCondition_CreditCondition]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CreditRequestCreditCondition] DROP CONSTRAINT [FK_CreditRequestCreditCondition_CreditCondition];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerWorkCenter]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WorkCenters] DROP CONSTRAINT [FK_CustomerWorkCenter];
GO
IF OBJECT_ID(N'[dbo].[FK_PaymentCreditRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Payments] DROP CONSTRAINT [FK_PaymentCreditRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeCreditRequest]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CreditRequests] DROP CONSTRAINT [FK_EmployeeCreditRequest];
GO
IF OBJECT_ID(N'[dbo].[FK_CustomerAddressCustomer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [FK_CustomerAddressCustomer];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[BankAccounts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BankAccounts];
GO
IF OBJECT_ID(N'[dbo].[Contacts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Contacts];
GO
IF OBJECT_ID(N'[dbo].[CreditConditions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CreditConditions];
GO
IF OBJECT_ID(N'[dbo].[CreditPolicies]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CreditPolicies];
GO
IF OBJECT_ID(N'[dbo].[CreditRequests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CreditRequests];
GO
IF OBJECT_ID(N'[dbo].[CustomerAddresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomerAddresses];
GO
IF OBJECT_ID(N'[dbo].[CustomerContactInfoes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomerContactInfoes];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Employees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Employees];
GO
IF OBJECT_ID(N'[dbo].[Payments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Payments];
GO
IF OBJECT_ID(N'[dbo].[WorkCenters]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WorkCenters];
GO
IF OBJECT_ID(N'[dbo].[CreditRequestCreditCondition]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CreditRequestCreditCondition];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'BankAccounts'
CREATE TABLE [dbo].[BankAccounts] (
    [BankAccountId] int IDENTITY(1,1) NOT NULL,
    [InterbankCode] nvarchar(max)  NULL,
    [CardNumber] nvarchar(max)  NULL,
    [AccountType] nvarchar(max)  NULL,
    [CardType] nvarchar(max)  NULL,
    [BankName] nvarchar(max)  NULL,
    [CustomerId] int  NOT NULL
);
GO

-- Creating table 'Contacts'
CREATE TABLE [dbo].[Contacts] (
    [ContactId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [FirstSurname] nvarchar(max)  NULL,
    [SecondSurname] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [CustomerId] int  NOT NULL
);
GO

-- Creating table 'CreditConditions'
CREATE TABLE [dbo].[CreditConditions] (
    [CreditConditionId] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'CreditPolicies'
CREATE TABLE [dbo].[CreditPolicies] (
    [CreditPolicyId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [Active] bit  NULL,
    [EffectiveDate] datetime  NULL
);
GO

-- Creating table 'CreditRequests'
CREATE TABLE [dbo].[CreditRequests] (
    [CreditRequestId] int IDENTITY(1,1) NOT NULL,
    [FileNumber] nvarchar(max)  NULL,
    [Amount] float  NULL,
    [Status] int  NULL,
    [TimePeriod] datetime  NULL,
    [Purpose] nvarchar(max)  NULL,
    [InterestRate] decimal(18,0)  NULL,
    [CreationDate] datetime  NULL,
    [EmployeeId] int  NULL,
    [CustomerId] int  NOT NULL,
    [TransferBankAccount_BankAccountId] int  NOT NULL,
    [DirectDebitBankAccount_BankAccountId] int  NOT NULL,
    [Employee_EmployeeId] int  NOT NULL
);
GO

-- Creating table 'CustomerAddresses'
CREATE TABLE [dbo].[CustomerAddresses] (
    [CustomerAddressId] int IDENTITY(1,1) NOT NULL,
    [Street] nvarchar(max)  NULL,
    [ZipCode] nvarchar(max)  NULL,
    [ExternalNumber] nvarchar(max)  NULL,
    [InternalNumber] nvarchar(max)  NULL,
    [CustomerId] int  NOT NULL,
    [Colony] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CustomerContactInfoes'
CREATE TABLE [dbo].[CustomerContactInfoes] (
    [CustomerContactInfoId] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NULL,
    [PhoneNumberOne] nvarchar(max)  NULL,
    [PhoneNumberTwo] nvarchar(max)  NULL,
    [CustomerId] int  NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [FirstSurname] nvarchar(max)  NULL,
    [SecondSurname] nvarchar(max)  NULL,
    [Curp] nvarchar(max)  NULL,
    [Rfc] nvarchar(max)  NULL,
    [CustomerAddress_CustomerAddressId] int  NULL
);
GO

-- Creating table 'Employees'
CREATE TABLE [dbo].[Employees] (
    [EmployeeId] int IDENTITY(1,1) NOT NULL,
    [FirstSurname] nvarchar(max)  NULL,
    [SecondSurname] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NULL,
    [Name] nvarchar(max)  NULL,
    [Password] nvarchar(max)  NULL,
    [Role] smallint  NOT NULL
);
GO

-- Creating table 'Payments'
CREATE TABLE [dbo].[Payments] (
    [PaymentId] int IDENTITY(1,1) NOT NULL,
    [FileNumber] nvarchar(max)  NULL,
    [PaymentDate] datetime  NULL,
    [Amount] nvarchar(max)  NULL,
    [CreditRequestId] int  NULL,
    [CreditRequests_CreditRequestId] int  NOT NULL
);
GO

-- Creating table 'WorkCenters'
CREATE TABLE [dbo].[WorkCenters] (
    [WorkCenterId] int IDENTITY(1,1) NOT NULL,
    [CenterName] nvarchar(60)  NULL,
    [Street] nvarchar(60)  NULL,
    [Colony] nvarchar(60)  NULL,
    [InnerNumber] int  NULL,
    [OutsideNumber] int  NULL,
    [ZipCode] int  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [CustomerId] int  NULL,
    [Customer_CustomerId] int  NULL
);
GO

-- Creating table 'CreditRequestCreditCondition'
CREATE TABLE [dbo].[CreditRequestCreditCondition] (
    [CreditRequests_CreditRequestId] int  NOT NULL,
    [CreditConditions_CreditConditionId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [BankAccountId] in table 'BankAccounts'
ALTER TABLE [dbo].[BankAccounts]
ADD CONSTRAINT [PK_BankAccounts]
    PRIMARY KEY CLUSTERED ([BankAccountId] ASC);
GO

-- Creating primary key on [ContactId] in table 'Contacts'
ALTER TABLE [dbo].[Contacts]
ADD CONSTRAINT [PK_Contacts]
    PRIMARY KEY CLUSTERED ([ContactId] ASC);
GO

-- Creating primary key on [CreditConditionId] in table 'CreditConditions'
ALTER TABLE [dbo].[CreditConditions]
ADD CONSTRAINT [PK_CreditConditions]
    PRIMARY KEY CLUSTERED ([CreditConditionId] ASC);
GO

-- Creating primary key on [CreditPolicyId] in table 'CreditPolicies'
ALTER TABLE [dbo].[CreditPolicies]
ADD CONSTRAINT [PK_CreditPolicies]
    PRIMARY KEY CLUSTERED ([CreditPolicyId] ASC);
GO

-- Creating primary key on [CreditRequestId] in table 'CreditRequests'
ALTER TABLE [dbo].[CreditRequests]
ADD CONSTRAINT [PK_CreditRequests]
    PRIMARY KEY CLUSTERED ([CreditRequestId] ASC);
GO

-- Creating primary key on [CustomerAddressId] in table 'CustomerAddresses'
ALTER TABLE [dbo].[CustomerAddresses]
ADD CONSTRAINT [PK_CustomerAddresses]
    PRIMARY KEY CLUSTERED ([CustomerAddressId] ASC);
GO

-- Creating primary key on [CustomerContactInfoId] in table 'CustomerContactInfoes'
ALTER TABLE [dbo].[CustomerContactInfoes]
ADD CONSTRAINT [PK_CustomerContactInfoes]
    PRIMARY KEY CLUSTERED ([CustomerContactInfoId] ASC);
GO

-- Creating primary key on [CustomerId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerId] ASC);
GO

-- Creating primary key on [EmployeeId] in table 'Employees'
ALTER TABLE [dbo].[Employees]
ADD CONSTRAINT [PK_Employees]
    PRIMARY KEY CLUSTERED ([EmployeeId] ASC);
GO

-- Creating primary key on [PaymentId] in table 'Payments'
ALTER TABLE [dbo].[Payments]
ADD CONSTRAINT [PK_Payments]
    PRIMARY KEY CLUSTERED ([PaymentId] ASC);
GO

-- Creating primary key on [WorkCenterId] in table 'WorkCenters'
ALTER TABLE [dbo].[WorkCenters]
ADD CONSTRAINT [PK_WorkCenters]
    PRIMARY KEY CLUSTERED ([WorkCenterId] ASC);
GO

-- Creating primary key on [CreditRequests_CreditRequestId], [CreditConditions_CreditConditionId] in table 'CreditRequestCreditCondition'
ALTER TABLE [dbo].[CreditRequestCreditCondition]
ADD CONSTRAINT [PK_CreditRequestCreditCondition]
    PRIMARY KEY CLUSTERED ([CreditRequests_CreditRequestId], [CreditConditions_CreditConditionId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerId] in table 'BankAccounts'
ALTER TABLE [dbo].[BankAccounts]
ADD CONSTRAINT [FK_BankAccountCustomer]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([CustomerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BankAccountCustomer'
CREATE INDEX [IX_FK_BankAccountCustomer]
ON [dbo].[BankAccounts]
    ([CustomerId]);
GO

-- Creating foreign key on [CustomerId] in table 'Contacts'
ALTER TABLE [dbo].[Contacts]
ADD CONSTRAINT [FK_CustomerContact]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([CustomerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerContact'
CREATE INDEX [IX_FK_CustomerContact]
ON [dbo].[Contacts]
    ([CustomerId]);
GO

-- Creating foreign key on [CustomerId] in table 'CreditRequests'
ALTER TABLE [dbo].[CreditRequests]
ADD CONSTRAINT [FK_CreditRequestCustomer]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([CustomerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CreditRequestCustomer'
CREATE INDEX [IX_FK_CreditRequestCustomer]
ON [dbo].[CreditRequests]
    ([CustomerId]);
GO

-- Creating foreign key on [CustomerId] in table 'CustomerContactInfoes'
ALTER TABLE [dbo].[CustomerContactInfoes]
ADD CONSTRAINT [FK_CustomerId]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[Customers]
        ([CustomerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerId'
CREATE INDEX [IX_FK_CustomerId]
ON [dbo].[CustomerContactInfoes]
    ([CustomerId]);
GO

-- Creating foreign key on [TransferBankAccount_BankAccountId] in table 'CreditRequests'
ALTER TABLE [dbo].[CreditRequests]
ADD CONSTRAINT [FK_CreditRequestBankAccount]
    FOREIGN KEY ([TransferBankAccount_BankAccountId])
    REFERENCES [dbo].[BankAccounts]
        ([BankAccountId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CreditRequestBankAccount'
CREATE INDEX [IX_FK_CreditRequestBankAccount]
ON [dbo].[CreditRequests]
    ([TransferBankAccount_BankAccountId]);
GO

-- Creating foreign key on [DirectDebitBankAccount_BankAccountId] in table 'CreditRequests'
ALTER TABLE [dbo].[CreditRequests]
ADD CONSTRAINT [FK_CreditRequestBankAccount1]
    FOREIGN KEY ([DirectDebitBankAccount_BankAccountId])
    REFERENCES [dbo].[BankAccounts]
        ([BankAccountId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CreditRequestBankAccount1'
CREATE INDEX [IX_FK_CreditRequestBankAccount1]
ON [dbo].[CreditRequests]
    ([DirectDebitBankAccount_BankAccountId]);
GO

-- Creating foreign key on [CreditRequests_CreditRequestId] in table 'CreditRequestCreditCondition'
ALTER TABLE [dbo].[CreditRequestCreditCondition]
ADD CONSTRAINT [FK_CreditRequestCreditCondition_CreditRequest]
    FOREIGN KEY ([CreditRequests_CreditRequestId])
    REFERENCES [dbo].[CreditRequests]
        ([CreditRequestId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CreditConditions_CreditConditionId] in table 'CreditRequestCreditCondition'
ALTER TABLE [dbo].[CreditRequestCreditCondition]
ADD CONSTRAINT [FK_CreditRequestCreditCondition_CreditCondition]
    FOREIGN KEY ([CreditConditions_CreditConditionId])
    REFERENCES [dbo].[CreditConditions]
        ([CreditConditionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CreditRequestCreditCondition_CreditCondition'
CREATE INDEX [IX_FK_CreditRequestCreditCondition_CreditCondition]
ON [dbo].[CreditRequestCreditCondition]
    ([CreditConditions_CreditConditionId]);
GO

-- Creating foreign key on [Customer_CustomerId] in table 'WorkCenters'
ALTER TABLE [dbo].[WorkCenters]
ADD CONSTRAINT [FK_CustomerWorkCenter]
    FOREIGN KEY ([Customer_CustomerId])
    REFERENCES [dbo].[Customers]
        ([CustomerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerWorkCenter'
CREATE INDEX [IX_FK_CustomerWorkCenter]
ON [dbo].[WorkCenters]
    ([Customer_CustomerId]);
GO

-- Creating foreign key on [CreditRequests_CreditRequestId] in table 'Payments'
ALTER TABLE [dbo].[Payments]
ADD CONSTRAINT [FK_PaymentCreditRequest]
    FOREIGN KEY ([CreditRequests_CreditRequestId])
    REFERENCES [dbo].[CreditRequests]
        ([CreditRequestId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PaymentCreditRequest'
CREATE INDEX [IX_FK_PaymentCreditRequest]
ON [dbo].[Payments]
    ([CreditRequests_CreditRequestId]);
GO

-- Creating foreign key on [Employee_EmployeeId] in table 'CreditRequests'
ALTER TABLE [dbo].[CreditRequests]
ADD CONSTRAINT [FK_EmployeeCreditRequest]
    FOREIGN KEY ([Employee_EmployeeId])
    REFERENCES [dbo].[Employees]
        ([EmployeeId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeCreditRequest'
CREATE INDEX [IX_FK_EmployeeCreditRequest]
ON [dbo].[CreditRequests]
    ([Employee_EmployeeId]);
GO

-- Creating foreign key on [CustomerAddress_CustomerAddressId] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [FK_CustomerAddressCustomer]
    FOREIGN KEY ([CustomerAddress_CustomerAddressId])
    REFERENCES [dbo].[CustomerAddresses]
        ([CustomerAddressId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerAddressCustomer'
CREATE INDEX [IX_FK_CustomerAddressCustomer]
ON [dbo].[Customers]
    ([CustomerAddress_CustomerAddressId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------