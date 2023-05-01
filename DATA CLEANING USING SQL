/* 
DATA CLEANING USING SQL
*/
-------------------------------------------------------
--Removing/UPDATE NULL values
 
UPDATE dbo.[Refined_TK_data ver 2]
set Item_Category='Unknown'
where Item_Category is null

UPDATE dbo.[Refined_TK_data ver 2]
set Retained =0, Retention_Cost=0,Assessed_Value=0
where Retained is null
or Retention_Cost is  null 
or Assessed_Value is null

UPDATE dbo.[Refined_TK_data ver 2]
set Affiliation='None'
where Affiliation is null

DELETE from dbo.[Refined_TK_data ver 2]
where Detail_of_Gifts is null

Delete FROM [tosha_kahana].[dbo].[Refined_TK_data ver 2]
where Date is null or Remarks is null 


DELETE from dbo.[Refined_TK_data ver 2]
where Recipient_Name is null



-------------------------------------------------------------
-- Breaking out NAME_OF_RECIPIENT into Individual Columns 
SELECT 
     PARSENAME(REPLACE(Name_of_Recipient, ',', '.'), 2) AS [Recipient_Name]
   , PARSENAME(REPLACE(Name_of_Recipient, ',', '.'), 1) AS [Assignation]
   
FROM [dbo].[Refined_TK_data ver 2]

alter table [dbo].[Refined_TK_data ver 2]
add Recipient_Name varchar(Max)

update [dbo].[Refined_TK_data ver 2]
set Recipient_Name=PARSENAME(REPLACE(Name_of_Recipient, ',', '.'), 2)

alter table [dbo].[Refined_TK_data ver 2]
add assignation varchar(Max)

update [dbo].[Refined_TK_data ver 2]
set assignation=PARSENAME(REPLACE(Name_of_Recipient, ',', '.'), 1)




------------------------------------------------------------------

--delete the UNUSED columns 
Alter table [dbo].[Refined_TK_data ver 2]
Drop column name_of_recipient






select * from [dbo].[Refined_TK_data ver 2]
