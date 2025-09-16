              -- TRANSACT SQL

--VARIABLES OR PARAMETERS =


Declare @Id int
set @Id=10
select @Id

declare @Id1 int, @Id2 int
set @Id1=100
set @Id2=101
select @Id1 , @Id2

declare @Id1 int , @Name varchar(100)
set @Id1 = 11
set @Name = 'Santhosh'
select @Id1 , @Name

declare @Text varchar(100) , @Name varchar(100)
set @Text = 'welcome to J2D ,'
set @Name = 'Santhosh'
select @Text + @Name

-- WHILE LOOP

declare @number int
set @number=0
while @number <= 1000
begin
if(@number%2=0)
print @number
set @number = @number +1
end

-- CASE STATEMENT MOST IMPORTANT

    select *,
    case
    when salary <25000 then 'salary is Average'
    when salary>=25000 and salary <30000 then 'salary is good'
    when salary>=30000 and salary< 35000 then 'salary is great'
    when salary >=35000 then 'salary is excellent'
    end as salarystatus
    from Employee_Details

    select * from Employee_Details

    select *,
    case
    when company='TCS' then salary*0.02
    when company='Samsung' then salary*0.08
    when company='Accenture' then salary*0.05
    when company='Genpact' then salary*0.04
    when company='IBM' then salary*0.07
    when company='Virtusa' then salary*0.03
    when company='Deloitte' then salary*0.06
    when company = 'Nokia' then salary*0.09
    else salary*0.01
    end as Bonus
    from Employee_Details