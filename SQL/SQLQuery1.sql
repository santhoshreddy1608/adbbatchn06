select *
from Employees

insert into Employees values(101,'Mahesh Reddy','Male',120000)
insert into Employees values (102,'Charitha Reddy','Female',130000)
insert into Employees values (103, 'Shiva Reddy','Male',70000)
insert into Employees values (104,'Nalini Reddy','Female',50000)
insert into Employees values (106,'Naveen Reddy','Male',40000)

update Employees set EmployeeId=106 where EmployeeName='Charitha Reddy'

Create table Employees
(
EmployeeId int,
EmployeeName varchar(100),
Gender varchar(100),
Salary money
)

update Employees set Salary=150000 where EmployeeId=101

delete from Employees where EmployeeId=106


--TCL
create table Products
(
ProductId int,
ProductName varchar(100),
ProductType varchar(100)
)

begin Transaction
insert into Products values(1,'chairs','Furnitures')
insert into Products values(2,'Phones','Electronics')
commit Transaction

begin Transaction
insert into Products values(3,'Sofas','Furnitures')
insert into Products values (4,'Xpulse','Motor Vehicles')
commit Transaction

select * from Products
delete from Products where ProductId IN (1,2)
delete from Products where ProductId IN (3,4)

drop table Transactions

--Unique Key
create table Transactions
(
Id int unique,
Name varchar(100) unique,
Type varchar(100),
Price money
)

select * from Transactions

insert into Transactions values (1,'Products','credit card',20000)
insert into Transactions values(1, 'fruits','UPI',300) -- cannot add duplicate value because of unique key added to column

alter table Transactions
drop constraint  [UQ__Transact__737584F653AA163D]

alter table  Transactions
add constraint unique_id unique(Id)
select * from Transactions
--Primary Key
create table Customers
(
Id int primary key,
Name varchar(100),
City varchar(100),
State varchar(100)
)

insert into Customers values (1,'Santhosh Reddy','kadapa','Andhra Pradesh')
insert into Customers values (1,'Santhosh Reddy','kadapa','Andhra Pradesh')

delete from customers where Id=1

select * from Customers

-- how to remove primary key from column
-- syntax

alter table Customers
drop constraint [PK__Customer__3214EC07A7EE5E6C] -- draged from database customers table keys 

 -- how to readd the primary key
 alter table customers
 add constraint PK_Id primary key(Id)


 -- Foreign key

 create table Department
 (
 Id int primary key,
 Name varchar(100)
 )

 --Department = HR, IT, FINANCE, ADMIN, OPERATIONS

 insert into Department values(1, 'HR')
 INSERT INTO Department values(2,'IT')
 insert into Department values (3,'Finance')
 insert into Department values(4,'Admin')
 insert into Department values(5,'Operations')

 select * from Department


 create table Emp_Dept_Details
 (
 EmpId int,
 EmpName varchar(100),
 Gender varchar(100),
 DeptId int
 )

 insert into Emp_Dept_Details values(101,'Santhosh Reddy','Male',2)
 insert into Emp_Dept_Details values(102,'Charitha Reddy','female',1) 
 insert into Emp_Dept_Details values(103,'Mahesh Reddy','Male',3)
 insert into Emp_Dept_Details values(104,'Shiva Reddy','MAle',5)
 insert into Emp_Dept_Details values (105,'Nalini Reddy','Female',400)

 -- here 400 record  is incorrect it has to be approved first before being entering the table

 -- reference the column in Department table.
 -- if the record exists then only accept the record into another table.

 -- foriegn key constraint which will make sure the data entered is valid  and genuine

 alter table Emp_Dept_Details
 add constraint FK_DeptId foreign key(DeptId)
 references Department(Id)

 select * from Emp_Dept_Details

 --check constraint
    -- set the rulez that have been defined on the column tomake sure we have to follow that condition

    create table emp_Salary_Details
    (
    EmpId int,
    EmpName varchar(100),
    EmpDept varchar(100),
    Salary Money
    )

    insert into emp_Salary_Details values(111,'Santhosh Reddy','HR',40000)
    insert into emp_Salary_Details values(112, 'Shiva Reddy','Admin',-55000)

    -- here -55000 is invalid int he record
    --Check constrainnt will set the value to mmin aount of 10000

    --syntax :
 alter table emp_Salary_Details
 add Constraint Check_Salary Check(Salary >9999)

 delete from emp_Salary_Details where EmpId=112
   
   select * from emp_Salary_Details

   -- Default

   create table Cities
   (
   CityName varchar(100),
   stateName varchar(100),
   CountryName varchar(100)
   )

   alter table Cities
   add Constraint Default_Country Default('india') for CountryName

   insert into Cities(CityName,stateName)values ('Vizag','Andhra Pradesh')
   insert into Cities(CityName,stateName) values ('Bangalore','Karnataka')
   insert into cities(CityName,stateName) values ('Hyderabad','Telangana')

   select * from Cities

   -- Operators

   --Arithmetic Operators(+,-,*,/)
   -- comparison Operators(>,<,=,<=,>=)
   -- Logical Operators(and , or, not)
   -- Special Operators(Between , in, like)
   --Set Operators(union , union all, intersect,except)

   create table Employee_Details
   (
   Name varchar(100),
   Department varchar(100),
   Salary money,
   Bonus Money,
   City varchar(100),
   Company varchar(100),
   JoiningDate Date
   )

   insert into Employee_Details values ('Mahesh Reddy','IT',150000,100000,'Bangalore','Accenture','2018-11-25')
   insert into Employee_Details values('Lasya','Sales',23000,2700,'Pune','Samsung','2020-11-25')
   insert into Employee_Details values('Praveena','IT',31000,3200,'Mumbai','IBM','2023-10-12')
   insert into Employee_Details values('Jagadeesh','Admin',22000,2100,'Lucknow','TCS','2020-04-03')
   insert into Employee_Details values ('Pranam','Marketting',30500,3350,'Ahmedabad','Genpact','2023-05-21')
   insert into Employee_Details values('Siddhu','Operations',33000,3170,'Kochi','Nokia','2024-01-04')
   insert into Employee_Details values('Chaitanya','Finance',27500,2250,'Hyderabad','TCS','2024-12-05')
   insert into Employee_Details values('Sai','Finance',28000,2350,'Hyderabad','Samsung','2022-07-05')
   insert into Employee_Details values('Santhosh Reddy','IT',55000,10000,'Bangalore','Virtusa','2025-09-06')
   insert into Employee_Details values('Shiva Reddy','HR',30000,3000,'Chennai','Deloitte','2025-03-02')
   insert into Employee_Details values('Harshitha','Windows',34000,3400,'Delhi','HP','2021-10-15')

   update Employee_Details set Company='Nokia' where name='Siddhu'

   update Employee_Details set Company='Wipro' where Name='Chaitanya'

   Select * from Employee_Details
   -- Arithmetic Opeartor
   select Name,Salary,Bonus,  Salary+Bonus as Total_Salary
   from Employee_Details

   --Comparison Operator

   select *
   from Employee_Details
   where name='Mahesh Reddy'

   --Logical Operators 
   --AND Operator
   select name from Employee_Details where salary>25000
   and Department='Finance' --Chaitanya, Sai

   --OR Operator

   select name from Employee_Details where City='Hyderabad'
   or Department='IT'--Mahesh Reddy,Praveena ,Chaitanya, Sai, Santhosh Reddy

   --NOT Operator

   Select name from Employee_Details where not(City)='Hyderabad'

   --Special Operator

   --IN

   select name from Employee_Details
   where City in ('Bangalore','Pune','Chennai')  --   Mahesh Reddy
                                                 --   Lasya
                                                  --  Santhosh Reddy
                                                   -- Shiva Reddy

   --BETWEEN

   select name from Employee_Details 
   where salary between 25000 and 50000   --  Praveena
                                          --  Pranam
                                          --  Siddhu
                                           -- Chaitanya
                                          --  Sai
                                           -- Shiva Reddy
                                           -- Shiva Reddy
                                           -- Harshitha

   select name from Employee_Details
   where name like 'M%'  --Mahesh Reddy

    select * from Employee_Details

    -- CLAUSES

    --SELECT

    Select Name from Employee_Details

    --FROM

    select Department
    from Employee_Details

    --WHERE

    select name from Employee_Details
    where Salary>23000

    --GROUP BY

    select City,Department,count(name)
    from Employee_Details
    group by City,Department

    select Company, sum(Salary)
    from Employee_Details
    group by Company

    --HAVING
    select city, count(name)
    from Employee_Details
    group by city
    having count(name)>1
   

   --ORDER BY

   select * from Employee_Details
   order by salary Asc

   --DISTINCT

   select Distinct city
   from Employee_Details

   --TOP

   select top 3 *
   from Employee_Details

   select top 5 name 
   from Employee_Details

   --JOIN 


    select * from Employee_Details

    -- SET Operator

    --UNION = it will combine the data from two tables and removes the duplicate values and repeated values.

    create table Table1
    (
    Id int,
    Name varchar(100),
    Gender varchar(100),
    City varchar(100)
    )

    create table Table2
    (
    Id int,
    Name varchar(100),
    Gender varchar(100),
    City varchar(100)
    )

    select * from Table1

    insert into Table1 values (101,'ABC','Male','Bangalore')
    insert into Table2 values (102,'DEF','Female','Chennai')
    insert into Table2 values (103,'GHI','Male','Hyderabaad')
    insert into Table2 values (104,'PQR','Female','Pune')
    insert into Table2 values (105,'XYZ','Male','Bangalore')

    select * from Table1
    union
    Select *from Table2 -- it eliminates 102,103 from Table2  records because of those are prwssented in Table1


    --UNION ALL= combines the data from the tables irrespective of duplicates or not

    select * from Table1
    union all
    select * from Table2  -- it will return the data of both tables

    --INTERSECT = returns only matching rows or common rows

    select * from Table1
    intersect
    select * from Table2--matching rows from both the tables 102,103

    --EXCEPT = returns the records that are available in the Table1 but not in the  Table2

    select * from Table1
    except
    Select * from Table2  -- first it will eleminates the matching records from both the tables and returns only the table1 records.
                          -- 101,104,105 of Table1

    create table Users
    (
    UserId int,
    UserName varchar(100),
    SubscriptionName varchar(100),
    Status varchar(100)
    )

    create table Users1
    (
    UserId int,
    USerName varchar(100),
    SubscriptionName varchar(100)
    )

    insert into Users values(1,'Santhosh Reddy','Prime','completed')
    insert into Users values(2,'Mahessh Reddy','Netflix','InProgress')
    insert into Users values(2,'Shiva Reddy','Aha','InProgress')

    insert into Users1 values(1,'Charitha Reddy','Hotstar')
    insert into Users1 values(2,'Nalini Reddy','ETV Win')
    insert into Users1 values(3,'Sweety','SunNXT')

    select * from Users1

    --SYSTEM DEFINED FUNCTIONS

    -- AGGREGATE, 
    -- STRING,
    -- DATE
    -- CONVERSION

   -- AGGREGATE:used to perform the aggregations on the columns of the table

   --sum = adds all the numbers in a column

   select sum(salary)
   from Employee_Details

   -- sum functions works only with numbers

   --AVERAGE = total sum/ total numbers
   select avg(Salary)
   from Employee_Details

   -- MAX = returns the highest value

   select max(Salary) 
   from Employee_Details

   select max(Name)
   from Employee_Details -- it takes the highest alpha value in the order from A,B,C,....,X,Y,Z
    
    -- for finding the max salary employee details salary along with all details

    SELECT *
    FROM Employee_Details
    WHERE Salary = (SELECT MAX(Salary) FROM Employees)
   
   -- for finding the max salary employee details salary along with name
   
   SELECT TOP 2 Name, Salary
    FROM Employee_Details
    ORDER BY Salary DESC;

    -- MINIMUM = returns the lowest value

    select min(Bonus)
    from Employee_Details

    select min(JoiningDate)
    from Employee_Details

    -- COUNT= calculates total no.of rows

     select count(Name)
     from Employee_Details

     select count(*)
     from Employee_Details

     -- SUM, MAX, COUNT uses most of the time inn realtime projects

    select * from Employee_Details

    -- STRNIG FUNCTIONS

    -- LOWER = converts all the characters into lower case

    select Name, lower(Name)
    from Employee_Details

   -- UPPER = converts all the characters into upper case 

   select Name, upper(Name)
   from Employee_Details

   -- LENGTH = calculate no.of characters or alphabets in a single row

   select name, len(name)
   from Employee_Details

   -- LEFT = which returns the starting letters in the row

   select name, left(name, 3)
   from Employee_Details

   -- RIGHT = which returns the ending letters in the row

   select name, right(name, 3)
   from Employee_Details

   -- SUB STRINNG = which returns the mid of the row

   select name, substring(name, 3, 5)
   from Employee_Details

   -- CONCAT = combines the multiple columns into single column

   select name, city, concat(name, '@', city)
   from Employee_Details

   select name, salary, name + ' # ' + city
   from Employee_Details

   select name,, salary, name+' '+ salary
   from Employee_Details -- we didn't get output this function will be fixed by conversion function

   -- REVERSE = This will returns the string into reverse the characters

   select salary, reverse(salary)
   from Employee_Details

   -- REPLACE = reeplace certain portion of characters  with another characters

   select name, replace(name, 'a', 'b')
   from Employee_Details -- here a is the present in the names 
                         -- b is replaced by a in all the columns of names

   -- CHARINDEX = returns the position of text

   select name, charindex('d', name)
   from Employee_Details -- d is looking from the start of name and give the output of the position d

   -- if we have two 'd's if we want second d we have a function calledd case.

  -- ***  LENGTH,, LEFT, SUBSTRING, CHARINDEX, ARE MOST USED FUNCTUONS IN REAL TIME PROJECTS

  -- DATE FUNCTIONS = which returns the date and date values

  -- GETDATE =  which returns the date and time
             -- this function is most used in real time

    select getdate()

    select SYSDATETIME()

    select SYSUTCDATETIME()

    select year(getdate())

    select month(getdate())

    select day(getdate())

    -- how to conect the date functions to our existing table

    select *,
    year(joiningdate),
    month(joiningdate),
    day(joiningdate)
    from Employee_Details

    select * from Employee_Details

    -- DATEADD AND DATEDIFF

    -- DATEADD =  which will adds or remove some days or months or years to the existing table

    select dateadd(year, -1, getdate())

    select *, dateadd(month, 3, joiningdate)
    from Employee_Details

    -- DATEDIFF = most used function inn realtime
               -- used to extract number of years or months or days difference between the two dates

    select *, datediff(month,joiningdate,getdate())
    from Employee_Details -- here its shows the gap of joiningdate and todaydate difference

    -- DATEDIFF, GETDATE, DATEADD, YEAR MOST USED FUNCTIONS IN REAL TIME

    --CONVERSION FUNCTIONS = used to convert one datatype into another datatytpe
    -- 2 types of conversion functions
    -- 1. cast
    -- 2. convert
    -- both these functions will pproduce the same output, only difference is the way of response.
    

    --CAST = cast excepts column name first, datatype last
         cast(columnname ad datatype)

         select Name+ ' @ ' + cast(salary as varchar)
         from Employee_Details

    -- CONVERT = convert excepts datatype as first, columnnname last
           convert(datatype,  columnname)
           
           select name + ' ' + convert(varchar,salary)
           from Employee_Details
          
    -- when we want to combine two different datatypes, we can use cast or convert

    --JOINS =   used to combine the data from two multiple tables
             -- used to combine rows rows with the help of common column
             -- based on the reference column we can connect any number of tables.
             
             -- TYPES OF JOINS
                -- LEFT JOIN OR LEFT OUTER JOIN
                -- RIGHT JOIN OR RIGHT OUTER JOIN
                -- INNER JOIN
                -- FULL JOIN OR FULL OUTER JOIN
                -- CROSS JOIN OR CARTESIAN JOIN
                -- SELF JOIN

            --LEFT JOIN = which is uesd to return all the rows of left table and matching rows of right table

            -- RIGHT JOIN = which is used to return all the rows int he right table and matching records from left table.

            -- INNER JOIN = which is used to return only matching records from both the tables.

            -- FULL JOIN = which is used to return all the rows from two tables.

            -- CROSS JOIN = which is usedd to multiply the number of recirds from one table to number of records from another table.

            -- SELF JOIN = joininng the table with the same table itself.

      create table Product_Details
      (
      ProductId int,
      ProductName varchar(100),
      ProductPrice money,
      TransactionId int
      )

      create table Transaction_Details
      (
      Id int,
      Type varchar(100),
      TransactionDate date
      )

      insert into Product_Details values (101,'Phones',20000,1)
      insert into Product_Details values (102, 'Fans', 2000, 2)
      insert into Product_Details values (103,'Fruits', 300,3)
      insert into Product_Details values (104,'Apples',200,4)
      insert into Product_Details values (105, 'scissors', 500,5)

      insert into Transaction_Details values (1,'Electronics','2025-04-24')
      insert into Transaction_Details values (2,'Furnitures','2025-03-24')
      insert into Transaction_Details values (3,'Electricals','2025-02-24')
      insert into Transaction_Details values (6,'Fruits','2025-06-24')
      insert into Transaction_Details values (7,'Home Appliances','2025-07-24')

      select *
      from Product_Details pd
      inner join
      Transaction_Details td
      on pd.TransactionId = td.Id

      select *
      from Product_Details pd
      left join
      Transaction_Details td
      on pd.TransactionId= td.id

      select *
      from Product_Details pd
      cross join
      Transaction_Details td

     
       select *
      from Product_Details p1
      join
      Product_Details p2
      on p1.TransactionId=p2.TransactionId

      -- LEFT JOIN AND INNER JOIN MOST USED IN REAL TIME

      --VIEWS =  views is kind of backup table to the main table.

                -- if main table has lost has lost due to some reasons we can have the backup table in the form of views.
                -- whatever the functionalities a normal table contains the same way the view also has the same options.

     -- why we have to use the views ?
         --  views are used to protect column level security and row lwvwl security.
         -- view is used to restrict the column.

     -- creation of VIEW 
     -- syntax =

        create view viewname
        as 
        select * from table

        create view view_Employee_Details
        as 
        select * from Employee_Details

        drop view view_Employee_Detais

        select * from view_Employee_Details

        create view view_Employee_Detail
        as 
        select Name, Department, City from Employee_Details

        select * from view_Employee_Detail

        select * from Employee_Details

        drop view view_Emplyee_Details

        create view view_Bangalore_Employee_Details
        as
        select name from Employee_Details
        where City='Bangalore'

        select * from view_Bangalore_Employee_Details

        create view view_HR_Emplyee_Details
        as
        select name from Employee_Details
        where Salary>25000 and Department='HR'


        select * from view_HR_Emplyee_Details

        insert into Employee_Details values('Ramya','HR',28008, 2109, 'Bamgalore','Samsung','2025-12-12')
      select * from Employee_Details

      select * from view_Employee_Details

      insert into view_Employee_Detail values('Mohan','HR','Genpact')

      select * from view_Employee_Detail

      update view_Employee_Detail set city='Bangalore' where Name='ramya'

      -- if we insert a record  into the table the view also updates with the same record.
      -- if we update a record in the view the table also updated with the same record.
      -- they both are always connected.


      -- we can create view based on two tables

      create view view_Products_Transactions
      as
      select * from Product_Details p
      inner join
      Transaction_Details t
      on p.TransactionId=t.Id

      select * from view_Products_Transactions

      -- we can join the table with the view

      select * from Employee_Details e
      join
      view_Employee_Details v
      on e.Name= v.Name


      -- if we delete the table the view will be invalid.
      -- if we create the database the table should exist in the database.

      -- INDEXES =
           -- speed up the data retrival by creating a sorted list of values either in ascending or descending order.
           -- indexes will help us identify quickly what we are looking for
           -- which will help in the performance of all the queries
           -- if the queries are fast, it will improve the performance by consuming less memory.

           -- we have 2 types of indexes
                -- clustered index
                -- non clustered index

    select * from Employee_Details where name= 'Santhosh Reddy'
       -- what are the background operations on providing the above query? 
          -- press ctrl+m = actual execution plan
          -- actual no.of rows read =13
          -- searching for one employee, but is reading all the records and producing the data
          -- because there is no index defined in the table.

        -- Syntax for creating index
               
               create indextype indexname on table(column ordertype)

               --indextype = clustered or non clussterd
               -- ordertype = ascending or descending

        -- Clustered = sorts the records in either ascending or descending order  making it easier to identify the rows.
        
        create clustered index Index_Name on Employee_Details(Name asc)

        select * from Employee_Details

        create clustered index Index_salary on employee_Details(Salary desc)
      
                 -- Cannot create more than one clustered index on table 'employee_Details'. Drop the existing clustered index 'Index_Name' before creating another.


    -- WINDOW FUNCTIONS



          create table Students
          (
          StudentId int,
          StudentName varchar(100),
          StudentMarks int
          )

          insert  into students values(1,'Arif',95)
          insert  into students values(2,'Santhosh',95)
          insert  into students values(3,'Mahesh',95)
          insert  into students values(4,'Charitha',95)
          insert  into students values(5,'Shiva',90)
          insert  into students values(6,'Sweety',90)
          insert  into students values(7,'Nalini',85)
          insert  into students values(8,'Naveen',85)
          insert  into students values(9,'Raja reddy',80)
          insert  into students values(10,'Savitri',80)
          insert  into students values(11,'Venugopal Reddy',80)
          insert  into students values(12,'Anil',75)

          select * from Students

          select *,
          DENSE_RANK()over(order by StudentMarks desc)
          from Students
          -- output = 1,2,3,4,5

          select *,
          RANK()over(order by Studentmarks desc)
          from Students
          -- output = 1,5,7,9,12

          select *,
          ROW_NUMBER()over(order by studentmarks desc)
          from Students
          -- output = 1,2,3,4,5,6,7,8,9,10,11,12



  -- CTEs=
  
        select * from Employee_Details

          select E.Name, E.Department, E.Company
          from Employee_Details E
          inner join
          view_Employee_Detail V
          on E.Name=V.Name


          With CTE_table_join_view
          as
          (
          select E.Name, E.Department, E.Company
          from Employee_Details E
          inner join
          view_Employee_Detail V
          on E.Name=v.Name
          )
          select * from cte_table_join_view


          select Name from Employee_Details
          where Salary =(select max(Salary) from Employee_Details
          where salary < (select max(salary) from Employee_Details))

          select * from Employees
          select * from Employee_Details

          select employeename
          from Employees
          where EmployeeName =(select company
          from Employee_Details
          where Name='mahesh reddy')
    
    SELECT EmployeeName
     FROM Employees
     WHERE EmployeeName IN (
     SELECT Name
     FROM Employee_Details
     WHERE Company = 'Accenture'
     );

     select company
     from Employee_Details
     where Name =(select name 
     from Employees
     where EmployeeName='mahesh')