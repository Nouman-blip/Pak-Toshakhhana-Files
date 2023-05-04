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


UPDATE [dbo].[Refined_TK_data ver 2]
set Affiliation='Gen. Musharraf'
where Affiliation='Gen Mus' or Affiliation='Gen. Musharrafarraf'

UPDATE [dbo].[Refined_TK_data ver 2]
set name_of_recipient='Mr.imran khan, Prime Minister of Pakistan'
where name_of_recipient like '%Prime Minister%' and Affiliation='PTI'

UPDATE [dbo].[Refined_TK_data ver 2]
set Retained='none'
where Retained='0'

------------------------------------------------------------------







