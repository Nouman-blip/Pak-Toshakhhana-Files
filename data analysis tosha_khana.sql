/*

Data analysis of Pak Tosha_Khana files using SQL

*/

--- Total assessed value by detail_of_gifts
select detail_of_gifts, sum(Assessed_Value) as total_value
from [dbo].[Refined_TK_data ver 2]
group by detail_of_gifts
------------------------------------------------

--total assessed value, total_gifts, total_unique_gifts,avg_retention_cost,by former governments
select  count(Detail_of_Gifts) as Total_gifts,count(distinct Detail_of_Gifts) as Total_unique_gifts ,  sum(Assessed_Value) as Total_assessed_value, avg(Retention_Cost) as Avg_rentention_cost
from [dbo].[Refined_TK_data ver 2]

--------------------------------------------------
--- Top 3 affiliation which has highest no of gifts 
with highest_gift as 
(select affiliation,count(detail_of_gifts) as gifts
from [dbo].[Refined_TK_data ver 2]
group by Affiliation
),

 ranks1 as
(select  Affiliation, gifts, Rank() over( order by gifts desc) ranks
from highest_gift
)

select * from ranks1
where ranks<4
----------------------------------------------------------------


--under millitary affiliation total gifts received by each leaders

select  Name_of_recipient,affiliation,count(detail_of_gifts) as total_GIFTS
from  [dbo].[Refined_TK_data ver 2]
where Affiliation='Military'
group by  Name_of_recipient,Affiliation
order by total_GIFTS desc

-------------------------------------------------------------

--under Gen musharaf affiliation total gifts received by each leaders

select Name_of_recipient,affiliation,count(detail_of_gifts) as total_GIFTS
from  [dbo].[Refined_TK_data ver 2]
where Affiliation like '%Gen%'
group by Name_of_recipient,Affiliation
order by total_GIFTS desc
---------------------------------------------------------------

--under PTI affiliation total gifts received by each leaders

select  Name_of_recipient,affiliation,count(detail_of_gifts) as total_GIFTS
from  [dbo].[Refined_TK_data ver 2]
where Affiliation ='PTI'
group by  Name_of_recipient,Affiliation
order by total_GIFTS desc

----------------------------------------------------------------
--under Pmln affiliation total gifts received by each leaders

select Name_of_recipient,affiliation,count(detail_of_gifts) as total_GIFTS
from  [dbo].[Refined_TK_data ver 2]
where Affiliation ='PMLN'
group by Name_of_recipient,Affiliation
order by total_GIFTS desc

----------------------------------------------------------------
--under Ppp affiliation total gifts received by each leaders

select Name_of_recipient,affiliation,count(detail_of_gifts) as total_GIFTS
from  [dbo].[Refined_TK_data ver 2]
where Affiliation ='PPP'
group by Name_of_recipient,Affiliation
order by total_GIFTS desc

----------------------------------------------------------------

--under WITHOUT  affiliation total gifts received by each leaders

select Name_of_recipient,affiliation,count(detail_of_gifts) as total_GIFTS
from  [dbo].[Refined_TK_data ver 2]
where Affiliation ='NONE'
group by Name_of_recipient,Affiliation
order by total_GIFTS desc

----------------------------------------------------------------

--under media  affiliation total gifts received by each leaders

select Name_of_recipient,affiliation,count(detail_of_gifts) as total_GIFTS
from  [dbo].[Refined_TK_data ver 2]
where Affiliation ='media'
group by Name_of_recipient,Affiliation
order by total_GIFTS desc


----------------------------------------------------------------

--- former government's Foreign affairs minister gifts count 

select Name_of_Recipient, affiliation, COUNT(detail_of_gifts) as gifts_count
from [dbo].[Refined_TK_data ver 2]
where name_of_recipient like '%Foreign Affairs%'
group by Name_of_Recipient,Affiliation
order by gifts_count desc

----------------------------------------------------------------

--- former government's prime minister minister gifts count 

select Name_of_Recipient,Affiliation,COUNT(detail_of_gifts) as gifts_count
from [dbo].[Refined_TK_data ver 2]
where name_of_recipient like '%Prime Minister of Pakistan%' 
group by Name_of_Recipient,Affiliation
order by gifts_count desc

----------------------------------------------------------------
--- former government's president of pakistan gifts count 

select Name_of_Recipient,Affiliation,COUNT(detail_of_gifts) as gifts_count
from [dbo].[Refined_TK_data ver 2]
where name_of_recipient like '%President of Pakistan%' 
group by Name_of_Recipient,Affiliation
order by gifts_count desc

----------------------------------------------------------------

--- gifts which were not retain / retained details

-- Details of all gifts which were not retain, nor retain and either Retained means which were displayed, declared,broked.....etc.

select detail_of_Gifts, retained
from [dbo].[Refined_TK_data ver 2]
where Retained <> 'Yes' and Retained <> 'No'and Retained <> 'Auctioned'

--for auctioned

select detail_of_Gifts, retained
from [dbo].[Refined_TK_data ver 2]
where Retained ='Auctioned'

----------------------------------------------------------------------

--- Total retention cost by each affiliation and item category

select * from [dbo].[Refined_TK_data ver 2]

select item_category, affiliation, count(Retention_Cost) as Rentention_cost
from [dbo].[Refined_TK_data ver 2]
group by Item_Category,Affiliation
order by  Rentention_cost desc

------------------------------------------------------------------------
--- details of product yearly count gifts

SELECT Detail_of_Gifts,Year(date) as years ,COUNT(Detail_of_Gifts) as yearly_count 
FROM [dbo].[Refined_TK_data ver 2]
group by Year(date),Detail_of_Gifts
order by yearly_count desc

------------------------------------------------------------------------

---which year has highest NO of gifts count 

SELECT Year(date) as years ,COUNT(Detail_of_Gifts) as yearly_count_gifts
FROM [dbo].[Refined_TK_data ver 2]
group by Year(date)
order by yearly_count_gifts desc

----------------------------------------------------------------------------
