package leetcode.editor.cn;

#Table: Failed 
#
# +--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| fail_date    | date    |
#+--------------+---------+
#该表主键为 fail_date。
#该表包含失败任务的天数.
# 
#
# Table: Succeeded 
#
# +--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| success_date | date    |
#+--------------+---------+
#该表主键为 success_date。
#该表包含成功任务的天数.
# 
#
# 
#
# 系统 每天 运行一个任务。每个任务都独立于先前的任务。任务的状态可以是失败或是成功。 
#
# 编写一个 SQL 查询 2019-01-01 到 2019-12-31 期间任务连续同状态 period_state 的起止日期（start_date 和 
#end_date）。即如果任务失败了，就是失败状态的起止日期，如果任务成功了，就是成功状态的起止日期。 
#
# 最后结果按照起始日期 start_date 排序 
#
# 查询结果样例如下所示: 
#
# Failed table:
#+-------------------+
#| fail_date         |
#+-------------------+
#| 2018-12-28        |
#| 2018-12-29        |
#| 2019-01-04        |
#| 2019-01-05        |
#+-------------------+
#
#Succeeded table:
#+-------------------+
#| success_date      |
#+-------------------+
#| 2018-12-30        |
#| 2018-12-31        |
#| 2019-01-01        |
#| 2019-01-02        |
#| 2019-01-03        |
#| 2019-01-06        |
#+-------------------+
#
#
#Result table:
#+--------------+--------------+--------------+
#| period_state | start_date   | end_date     |
#+--------------+--------------+--------------+
#| succeeded    | 2019-01-01   | 2019-01-03   |
#| failed       | 2019-01-04   | 2019-01-05   |
#| succeeded    | 2019-01-06   | 2019-01-06   |
#+--------------+--------------+--------------+
#
#结果忽略了 2018 年的记录，因为我们只关心从 2019-01-01 到 2019-12-31 的记录
#从 2019-01-01 到 2019-01-03 所有任务成功，系统状态为 "succeeded"。
#从 2019-01-04 到 2019-01-05 所有任务失败，系统状态为 "failed"。
#从 2019-01-06 到 2019-01-06 所有任务成功，系统状态为 "succeeded"。
# 
#
# Related Topics 数据库 👍 71 👎 0

public class ReportContiguousDates{
	public static void main(String[] args) {
		Solution solution = new ReportContiguousDates().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select b.type period_state,min(date) start_date,max(date) end_date from
-- (select *,subdate(date,row_number() over(partition by type order by date)) diff from
-- (select 'failed' type,fail_date date from Failed
-- union
-- select 'succeeded' type,success_date date from Succeeded) a
-- where a.date between '2019-01-01' and '2019-12-31') b
-- group by b.type,b.diff
-- order by start_date

-- select
--     period_state,
--     min(date) as start_date,
--     max(date) as end_date
-- from
--     (select
--          period_state,
--          date,
--          row_number() over(order by date) -
--          row_number() over(partition by period_state order by date) as rnk_diff
--      from (select
--          fail_date as date,
--          'failed' as period_state
--          from Failed
--          union
--          select
--          success_date,
--          'succeeded'
--          from Succeeded) a
--      where date between '2019-01-01' and '2019-12-31') t
-- group by period_state, rnk_diff
-- order by start_date

select
    period_state,
    min(date) start_date,
    max(date) end_date
from (
         select
             'succeeded' period_state,
             success_date date,
    if(datediff(@pre_date, @pre_date:=success_date) = -1, @id, @id:=@id+1) rn
         from succeeded, (select @pre_date:=null, @id:=0) init
         union
         select
             'failed' period_state,
             fail_date date,
             if(datediff(@pre_date, @pre_date:=fail_date) = -1, @id, @id:=@id+1) rn
         from failed, (select @pre_date:=null, @id:=0) init
     ) temp where date between '2019-01-01' and '2019-12-31'
group by period_state, rn
order by start_date;

-- select type as period_state, min(date) as start_date, max(date) as end_date
-- from
--     (
--         select type, date, subdate(date,row_number()over(partition by type order by date)) as diff
--         from
--             (
--             select 'failed' as type, fail_date as date from Failed
--             union all
--             select 'succeeded' as type, success_date as date from Succeeded
--             ) a
--     )a
-- where date between '2019-01-01' and '2019-12-31'
-- group by type,diff
-- order by start_date

#leetcode submit region end(Prohibit modification and deletion)

}
