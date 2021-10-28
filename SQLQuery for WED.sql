--looking at the economic dataset

select * from PortfolioProject..eco$


--1. 1st Dashboard page
-----------------------

--GDP
select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$
where [Subject Descriptor]='Gross domestic product, current prices' and Units='U.S. dollars'

--% change in GDP
select  Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$
where [Subject Descriptor]='Gross domestic product, current prices' and Units='Percent change'

-- Top 25 GDPs of 2020
select top 25 Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$ 
where [Subject Descriptor]='Gross domestic product, current prices' and Units='U.S. dollars'
order by [2020] desc 

--GDP Deflator
select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$
where [Subject Descriptor]='Gross domestic product, deflator' and Units='Index'

--Currency rates (USD) from currency dataset after cleaning dataset
select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..cur
WHERE ([2010] IS NOT NULL 
AND [2013] IS NOT NULL
AND [2014] IS NOT NULL
AND [2015] IS NOT NULL
AND [2017] IS NOT NULL
AND [2020] IS NOT NULL) AND
([2010]<>[2011] OR Country='United States')

--2. 2nd Dashboard page
-----------------------

-- Inflation Index
select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$
where [Subject Descriptor]='Inflation, average consumer prices' and Units='Index'

-- Inflation Index % Change
select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$
where [Subject Descriptor]='Inflation, average consumer prices' and Units='Percent change'

-- Inflation Index change of top 25 GDPs
select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$ 
where [Subject Descriptor]='Inflation, average consumer prices' and Units='Percent change'
and Country in 
(
select top 25 Country from PortfolioProject..eco$ 
where [Subject Descriptor]='Gross domestic product, current prices' and Units='U.S. dollars'
order by [2020] desc 
)

--3. 3rd Dashboard page
-----------------------
--looking at the unemployment dataset

select * from PortfolioProject..ue$

--Unemployment Rate from Unemployment dataset

select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..ue$
where 
([2010] IS NOT NULL AND [2020] IS NOT NULL)

--Unemployment rate from Unemployment dataset (ue$) of top 10 GDPs from eco$ dataset
select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..ue$ 
where 
Country in 
(
select top 12 Country from PortfolioProject..eco$ 
where [Subject Descriptor]='Gross domestic product, current prices' and Units='U.S. dollars'
order by [2020] desc 
)

--Population (top 50 of 2020)
select top 50 Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$
where [Subject Descriptor]='Population' and Units='Persons'
order by [2020] desc

--selecting top 100 
select top 100 Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$
where [Subject Descriptor]='Population' and Units='Persons'
order by [2020] desc

select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..ue$ 
where 
Country in 
(
select top 100 Country from PortfolioProject..eco$
where [Subject Descriptor]='Population' and Units='Persons'
order by [2020] desc
)

--4. 4th Dashboard page
-----------------------
--Financials of top 25 GDPs
select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$ 
where [Subject Descriptor]='General government revenue' and Units='Percent of GDP'
and Country in 
(
select top 25 Country from PortfolioProject..eco$ 
where [Subject Descriptor]='Gross domestic product, current prices' and Units='U.S. dollars'
order by [2020] desc 
)

select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$ 
where [Subject Descriptor]='General government total expenditure' and Units='Percent of GDP'
and Country in 
(
select top 25 Country from PortfolioProject..eco$ 
where [Subject Descriptor]='Gross domestic product, current prices' and Units='U.S. dollars'
order by [2020] desc 
)

select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$ 
where [Subject Descriptor]='General government gross debt' and Units='Percent of GDP'
and Country in 
(
select top 25 Country from PortfolioProject..eco$ 
where [Subject Descriptor]='Gross domestic product, current prices' and Units='U.S. dollars'
order by [2020] desc 
)

select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$ 
where [Subject Descriptor]='Current account balance' and Units='Percent of GDP'
and Country in 
(
select top 25 Country from PortfolioProject..eco$ 
where [Subject Descriptor]='Gross domestic product, current prices' and Units='U.S. dollars'
order by [2020] desc 
)

select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$ 
where [Subject Descriptor]='Gross national savings' and Units='Percent of GDP'
and Country in 
(
select top 25 Country from PortfolioProject..eco$ 
where [Subject Descriptor]='Gross domestic product, current prices' and Units='U.S. dollars'
order by [2020] desc 
)

select Country, [2010],[2011],[2012],[2013],[2014],[2015],[2016],[2017],[2018],[2019],[2020] from PortfolioProject..eco$ 
where [Subject Descriptor]='Total investment' and Units='Percent of GDP'
and Country in 
(
select top 25 Country from PortfolioProject..eco$ 
where [Subject Descriptor]='Gross domestic product, current prices' and Units='U.S. dollars'
order by [2020] desc 
)