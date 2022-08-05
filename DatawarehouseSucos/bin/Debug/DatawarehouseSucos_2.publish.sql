﻿/*
Deployment script for DW_SUCOS

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DW_SUCOS"
:setvar DefaultFilePrefix "DW_SUCOS"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key 18de529a-4a8c-4c29-b263-2d9da7ccab5c is skipped, element [dbo].[Dim_Categoria].[Id] (SqlSimpleColumn) will not be renamed to Cod_Categoria';


GO
PRINT N'Rename refactoring operation with key 6b026539-ee7f-4154-8ee8-460bc15361de, 876b14bf-df4a-4e88-94d9-1aae2a81af30 is skipped, element [dbo].[Dim_Marca].[Id] (SqlSimpleColumn) will not be renamed to Cod_Marca';


GO
PRINT N'Rename refactoring operation with key ade74100-0d27-48d6-ae29-729fb5d60af1 is skipped, element [dbo].[Dim_Produto].[Id] (SqlSimpleColumn) will not be renamed to Cod_Produto';


GO
PRINT N'Rename refactoring operation with key f26d14bf-1c45-44e8-8773-91eb211a5dbe is skipped, element [dbo].[Dim_Produto].[Cod_Marcar] (SqlSimpleColumn) will not be renamed to Cod_Marca';


GO
PRINT N'Rename refactoring operation with key 7310c34d-1ab8-420a-aba1-e6cc9e2c60aa is skipped, element [dbo].[Dim_Marca].[Desc_Marcar] (SqlSimpleColumn) will not be renamed to Desc_Marca';


GO
PRINT N'Creating Table [dbo].[Dim_Categoria]...';


GO
CREATE TABLE [dbo].[Dim_Categoria] (
    [Cod_Categoria]  NVARCHAR (50)  NOT NULL,
    [Desc_Categoria] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([Cod_Categoria] ASC)
);


GO
PRINT N'Creating Table [dbo].[Dim_Marca]...';


GO
CREATE TABLE [dbo].[Dim_Marca] (
    [Cod_Marca]     NVARCHAR (50)  NOT NULL,
    [Desc_Marca]    NVARCHAR (200) NULL,
    [Cod_Categoria] NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Cod_Marca] ASC)
);


GO
PRINT N'Creating Table [dbo].[Dim_Produto]...';


GO
CREATE TABLE [dbo].[Dim_Produto] (
    [Cod_Produto]  NVARCHAR (50)  NOT NULL,
    [Desc_Produto] NVARCHAR (200) NULL,
    [Atr_Tamanho]  NVARCHAR (200) NULL,
    [Atr_Sabor]    NVARCHAR (200) NULL,
    [Cod_Marca]    NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Cod_Produto] ASC)
);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Dim_Marca_Dim_Categoria]...';


GO
ALTER TABLE [dbo].[Dim_Marca] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Marca_Dim_Categoria] FOREIGN KEY ([Cod_Categoria]) REFERENCES [dbo].[Dim_Categoria] ([Cod_Categoria]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_Dim_Produto_Dim_Marca]...';


GO
ALTER TABLE [dbo].[Dim_Produto] WITH NOCHECK
    ADD CONSTRAINT [FK_Dim_Produto_Dim_Marca] FOREIGN KEY ([Cod_Marca]) REFERENCES [dbo].[Dim_Marca] ([Cod_Marca]);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '18de529a-4a8c-4c29-b263-2d9da7ccab5c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('18de529a-4a8c-4c29-b263-2d9da7ccab5c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6b026539-ee7f-4154-8ee8-460bc15361de')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6b026539-ee7f-4154-8ee8-460bc15361de')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ade74100-0d27-48d6-ae29-729fb5d60af1')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ade74100-0d27-48d6-ae29-729fb5d60af1')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f26d14bf-1c45-44e8-8773-91eb211a5dbe')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f26d14bf-1c45-44e8-8773-91eb211a5dbe')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '876b14bf-df4a-4e88-94d9-1aae2a81af30')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('876b14bf-df4a-4e88-94d9-1aae2a81af30')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '7310c34d-1ab8-420a-aba1-e6cc9e2c60aa')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('7310c34d-1ab8-420a-aba1-e6cc9e2c60aa')

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Dim_Marca] WITH CHECK CHECK CONSTRAINT [FK_Dim_Marca_Dim_Categoria];

ALTER TABLE [dbo].[Dim_Produto] WITH CHECK CHECK CONSTRAINT [FK_Dim_Produto_Dim_Marca];


GO
PRINT N'Update complete.';


GO