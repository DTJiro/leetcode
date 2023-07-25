package leetcode.editor.cn;

#Employee 表保存了一年内的薪水信息。 
#
# 请你编写 SQL 语句，对于每个员工，查询他除最近一个月（即最大月）之外，剩下每个月的近三个月的累计薪水（不足三个月也要计算）。 
#
# 结果请按 Id 升序，然后按 Month 降序显示。 
#
# 
#
# 示例： 输入： 
#
# 
#| Id | Month | Salary |
#|----|-------|--------|
#| 1  | 1     | 20     |
#| 2  | 1     | 20     |
#| 1  | 2     | 30     |
#| 2  | 2     | 30     |
#| 3  | 2     | 40     |
#| 1  | 3     | 40     |
#| 3  | 3     | 60     |
#| 1  | 4     | 60     |
#| 3  | 4     | 70     |
# 
#
# 输出： 
#
# 
#| Id | Month | Salary |
#|----|-------|--------|
#| 1  | 3     | 90     |
#| 1  | 2     | 50     |
#| 1  | 1     | 20     |
#| 2  | 1     | 20     |
#| 3  | 3     | 100    |
#| 3  | 2     | 40     |
# 
#
# 
#
# 解释： 
#
# 员工 '1' 除去最近一个月（月份 '4'），有三个月的薪水记录：月份 '3' 薪水为 40，月份 '2' 薪水为 30，月份 '1' 薪水为 20。 
#
# 所以近 3 个月的薪水累计分别为 (40 + 30 + 20) = 90，(30 + 20) = 50 和 20。 
#
# 
#| Id | Month | Salary |
#|----|-------|--------|
#| 1  | 3     | 90     |
#| 1  | 2     | 50     |
#| 1  | 1     | 20     |
# 
#
# 员工 '2' 除去最近的一个月（月份 '2'）的话，只有月份 '1' 这一个月的薪水记录。 
#
# 
#| Id | Month | Salary |
#|----|-------|--------|
#| 2  | 1     | 20     |
# 
#
# 员工 '3' 除去最近一个月（月份 '4'）后有两个月，分别为：月份 '3' 薪水为 60 和 月份 '2' 薪水为 40。所以各月的累计情况如下： 
#
# 
#| Id | Month | Salary |
#|----|-------|--------|
#| 3  | 3     | 100    |
#| 3  | 2     | 40     |
# 
#
# 
#
# Related Topics 数据库 👍 96 👎 0

public class FindCumulativeSalaryOfAnEmployee{
	public static void main(String[] args) {
		Solution solution = new FindCumulativeSalaryOfAnEmployee().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select a.Id,a.Month,sum(c.Salary) Salary from
-- Employee a inner join (select Id,max(Month) max from Employee group by Id) b
-- -- on a.Id=b.Id and a.Month != b.max left join Employee c on a.Id=c.Id and (a.Month = c.Month or a.Month-1=c.Month or a.Month-2=c.Month)
-- on a.Id=b.Id and a.Month != b.max left join Employee c on a.Id=c.Id and a.Month between c.Month and c.Month+2
-- group by a.Id,a.Month order by a.Id,a.Month desc

-- SELECT
--     E1.id,
--     E1.month,
--     (IFNULL(E1.salary, 0) + IFNULL(E2.salary, 0) + IFNULL(E3.salary, 0)) AS Salary
-- FROM
--     (SELECT
--          id, MAX(month) AS month
--      FROM
--          Employee
--      GROUP BY id
--      HAVING COUNT(*) > 1) AS maxmonth
--         LEFT JOIN
--     Employee E1 ON (maxmonth.id = E1.id
--         AND maxmonth.month > E1.month)
--         LEFT JOIN
--     Employee E2 ON (E2.id = E1.id
--         AND E2.month = E1.month - 1)
--         LEFT JOIN
--     Employee E3 ON (E3.id = E1.id
--         AND E3.month = E1.month - 2)
-- ORDER BY id ASC , month DESC

select Id,Month,Salary from
(select Id,Month,sum(Salary) over(partition by Id order by Month range 2 preceding) Salary,
rank() over(partition by Id order by Month desc) rn
from Employee) a where a.rn>1
order by Id,Month desc

#leetcode submit region end(Prohibit modification and deletion)

}
