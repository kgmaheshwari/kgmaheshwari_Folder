--Daily

select status,count(status) from FILEDETAILS
where cast( CreationTime as date) = '02-AUG-2019'--GETDATE() 
group by status;

select BotId,SUM(DATEDIFF(MI,CreationTime,LastModificationTime)) / count(FileNumber) Minutes from FILEDETAILS
where cast( CreationTime as date) = '02-AUG-2019'--GETDATE() 
group by BotId;

select BotId, count(FileNumber) FilesCount  from FILEDETAILS
where cast( CreationTime as date) = '02-AUG-2019'--GETDATE() 
group by BotId;

select BotId, 
count ( case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end )  Count_File,
 case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end as status_file
from FILEDETAILS 
where cast( CreationTime as date) = '02-AUG-2019'--GETDATE() 
group by BotId,case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end 

--Monthly
select status,count(status) count from FILEDETAILS
where  concat( concat(month(CreationTime),'-'), year(CreationTime)) = concat( concat(month(GETDATE()),'-'), year(CreationTime))
group by status;

select BotId,SUM(DATEDIFF(MI,CreationTime,LastModificationTime)) / count(FileNumber) minutes
from FILEDETAILS
where  concat( concat(month(CreationTime),'-'), year(CreationTime)) = concat( concat(month(GETDATE()),'-'), year(CreationTime))
group by BotId;

select BotId, count(FileNumber) count
from FILEDETAILS
where  concat( concat(month(CreationTime),'-'), year(CreationTime)) = concat( concat(month(GETDATE()),'-'), year(CreationTime))
group by BotId;

select BotId, 
count ( case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end )  Count_File,
 case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end as status_file
from FILEDETAILS 
where  concat( concat(month(CreationTime),'-'), year(CreationTime)) = concat( concat(month(GETDATE()),'-'), year(CreationTime))
group by BotId,case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end 

--Updated Monthly

create table[dbo].[BotRename] ( BotId varchar(100), NewBotName varchar(100));
insert into [dbo].[BotRename] values ('10.18.200.100','Astros');
insert into [dbo].[BotRename] values ('10.18.200.103','Rangers');
insert into [dbo].[BotRename] values ('10.70.107.250','Mavericks');
insert into [dbo].[BotRename] values ('4','Comets');
insert into [dbo].[BotRename] values ('5','Thunderbears');


select b.NewBotName, case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end status_desc,count(case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end) status_cnt
from FILEDETAILS a, BotRename  b
where  a.BotId=b.BotId 
and concat( concat(month(CreationTime),'-'), year(CreationTime)) = concat( concat(month(GETDATE()),'-'), year(CreationTime))
group by  b.NewBotName,case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end
order by NewBotName;

select b.NewBotName,SUM(DATEDIFF(MI,CreationTime,LastModificationTime)) / count(FileNumber) AvgTime
from FILEDETAILS a,  BotRename  b
where  a.BotId=b.BotId
and concat( concat(month(CreationTime),'-'), year(CreationTime)) = concat( concat(month(GETDATE()),'-'), year(CreationTime))
group by  b.NewBotName;


select b.NewBotName, count(FileNumber) FileCount
from FILEDETAILS a, BotRename  b
where  a.BotId=b.BotId
and concat( concat(month(CreationTime),'-'), year(CreationTime)) = concat( concat(month(GETDATE()),'-'), year(CreationTime))
group by b.NewBotName
order by b.NewBotName;


select b.NewBotName, 
count ( case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end )  CountFile,
 case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end as StatusFile
from FILEDETAILS  a,  BotRename  b
where  a.botid=b.BotId
and concat( concat(month(CreationTime),'-'), year(CreationTime)) = concat( concat(month(GETDATE()),'-'), year(CreationTime))
group by  b.NewBotName,case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end 
order by  b.NewBotName


--Updated Daily

select b.NewBotName, case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end status_desc,count(case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end) status_cnt
from FILEDETAILS a, BotRename  b
where  a.BotId=b.BotId 
and cast( CreationTime as date) = '02-AUG-2019'--GETDATE() 
group by  b.NewBotName,case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end
order by b.NewBotName;

select b.NewBotName,SUM(DATEDIFF(MI,CreationTime,LastModificationTime)) / count(FileNumber) AvgTime
from FILEDETAILS a, BotRename  b
where  a.BotId=b.BotId
and  cast( CreationTime as date) = '02-AUG-2019'--GETDATE() 
group by  b.NewBotName;


select b.NewBotName, count(FileNumber)  FileCount
from FILEDETAILS a,  BotRename  b
where  a.BotId=b.BotId
and cast( CreationTime as date) = '02-AUG-2019'--GETDATE() 
group by b.NewBotName
order by b.NewBotName;

select b.NewBotName, 
count ( case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end )  CountFile,
 case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end as StatusFile
from FILEDETAILS  a, BotRename  b
where  a.botid=b.BotId
and cast( CreationTime as date) = '02-AUG-2019'--GETDATE() 
group by  b.NewBotName,case when  Status='C'then 'Completed'
when Status='E' then 'Errored' 
when Status='P' then 'In Process'  end 
order by  b.NewBotName


select * from filedetails where BotId = '10.18.200.100'
select * from filedetails where BotId = '10.70.107.250' and cast(CreationTime as date) = '02-AUG-2019'
select * from BotRename


select b.NewBotName,DATEDIFF(MI,min(CreationTime),max(LastModificationTime)) / count(FileNumber) AvgTime
from FILEDETAILS a, BotRename  b
where  a.BotId=b.BotId
and  cast( CreationTime as date) = '02-AUG-2019'--GETDATE() 
group by  b.NewBotName;


select b.NewBotName,DATEDIFF(MI,min(CreationTime),max(LastModificationTime)) / count(FileNumber) AvgTime
from FILEDETAILS a,  BotRename  b
where  a.BotId=b.BotId
and concat( concat(month(CreationTime),'-'), year(CreationTime)) = concat( concat(month(GETDATE()),'-'), year(CreationTime))
group by  b.NewBotName;


select DATEDIFF(MI,min(CreationTime),max(LastModificationTime)) / count(FileNumber) AvgTime
from FILEDETAILS 
where BotId = '10.70.107.250'
and concat( concat(month(CreationTime),'-'), year(CreationTime)) = concat( concat(month(GETDATE()),'-'), year(CreationTime))


--my query
select b.NewBotName, sum(mins)/ sum(FilesCount) AvgTime
from (select botid,day(creationtime) [day], count(FileNumber) FilesCount ,DATEDIFF(MI,min(CreationTime),max(LastModificationTime)) Mins 
from filedetails
where concat( concat(month(CreationTime),'-'), year(CreationTime)) = concat( concat(month(GETDATE()),'-'), year(CreationTime))
group by botid, day(CreationTime)) a,BotRename b 
where  a.BotId=b.BotId group by a.BotId, b.NewBotName


--Agni query
SELECT NewBotName,ROUND(SUM(AvgTime)/COUNT(NewBotName),2) AvgTime FROM  ( 
select b.NewBotName,CreationTime, DATEDIFF(MI,min(CreationTime),max(LastModificationTime)) / count(FileNumber) AvgTime
from FILEDETAILS a, BotRename  b
where  a.BotId=b.BotId
and concat( concat(month(CreationTime),'-'), year(CreationTime)) = concat( concat(month(GETDATE()),'-'), year(CreationTime))
group by  b.NewBotName,CreationTime ) A
GROUP BY NewBotName