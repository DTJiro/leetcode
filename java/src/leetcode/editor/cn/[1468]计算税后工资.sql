package leetcode.editor.cn;

#Salaries 表： 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| company_id    | int     |
#| employee_id   | int     |
#| employee_name | varchar |
#| salary        | int     |
#+---------------+---------+
#在 SQL 中，(company_id, employee_id) 是这个表的主键
#这个表包括员工的company id, id, name 和 salary 
# 
#
# 
#
# 查找出每个员工的税后工资 
#
# 每个公司的税率计算依照以下规则 
#
# 
# 如果这个公司员工最高工资不到 $1000 ，税率为 0% 
# 如果这个公司员工最高工资在 [1000, 10000] 之间，税率为 24% 
# 如果这个公司员工最高工资大于 $10000 ，税率为 49% 
# 
#
# 按 任意顺序 返回结果。 
#
# 返回结果的格式如下例所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Salaries 表：
#+------------+-------------+---------------+--------+
#| company_id | employee_id | employee_name | salary |
#+------------+-------------+---------------+--------+
#| 1          | 1           | Tony          | 2000   |
#| 1          | 2           | Pronub        | 21300  |
#| 1          | 3           | Tyrrox        | 10800  |
#| 2          | 1           | Pam           | 300    |
#| 2          | 7           | Bassem        | 450    |
#| 2          | 9           | Hermione      | 700    |
#| 3          | 7           | Bocaben       | 100    |
#| 3          | 2           | Ognjen        | 2200   |
#| 3          | 13          | Nyancat       | 3300   |
#| 3          | 15          | Morninngcat   | 7777   |
#+------------+-------------+---------------+--------+
#输出：
#+------------+-------------+---------------+--------+
#| company_id | employee_id | employee_name | salary |
#+------------+-------------+---------------+--------+
#| 1          | 1           | Tony          | 1020   |
#| 1          | 2           | Pronub        | 10863  |
#| 1          | 3           | Tyrrox        | 5508   |
#| 2          | 1           | Pam           | 300    |
#| 2          | 7           | Bassem        | 450    |
#| 2          | 9           | Hermione      | 700    |
#| 3          | 7           | Bocaben       | 76     |
#| 3          | 2           | Ognjen        | 1672   |
#| 3          | 13          | Nyancat       | 2508   |
#| 3          | 15          | Morninngcat   | 5911   |
#+------------+-------------+---------------+--------+
#解释：
#对于公司 1，最高薪资为 21300。公司 1 的员工税率为 49%。
#对于公司 2，最高薪资为 700。公司 2 的员工税率为 0%。
#对于公司 3，最高薪资为 7777。公司 3 的员工税率为 24%。
#薪资扣除税后的金额计算公式为：薪资 - (税率百分比 / 100) * 薪资
#例如，Morninngcat（员工号 3，薪资为 7777）扣除税后的薪资为：7777 - 7777 * (24 / 100) = 7777 - 1866.4
#8 = 5910.52，四舍五入为 5911。 
#
# Related Topics 数据库 👍 20 👎 0

public class CalculateSalaries{
	public static void main(String[] args) {
		Solution solution = new CalculateSalaries().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select b.company_id,b.employee_id,b.employee_name,round(b.salary*(1-a.tax),0) salary from
(select company_id, case when max(salary)<1000 then 0
                        when max(salary)>=1000 and max(salary)<10000 then 0.24
                        else 0.49 end tax
from Salaries group by company_id) a left join Salaries b on a.company_id=b.company_id
order by b.company_id,b.employee_id

#leetcode submit region end(Prohibit modification and deletion)

}
