package leetcode.editor.cn;

#表: Candidates 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| employee_id | int  |
#| experience  | enum |
#| salary      | int  |
#+-------------+------+
#employee_id是此表的主键列。
#经验是包含一个值（“高级”、“初级”）的枚举类型。
#此表的每一行都显示候选人的id、月薪和经验。 
#
# 
#
# 一家公司想雇佣新员工。公司的工资预算是 70000 美元。公司的招聘标准是： 
#
# 
# 雇佣最多的高级员工。 
# 在雇佣最多的高级员工后，使用剩余预算雇佣最多的初级员工。 
# 
#
# 编写一个SQL查询，查找根据上述标准雇佣的高级员工和初级员工的数量。 按 任意顺序 返回结果表。 查询结果格式如下例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Candidates table:
#+-------------+------------+--------+
#| employee_id | experience | salary |
#+-------------+------------+--------+
#| 1           | Junior     | 10000  |
#| 9           | Junior     | 10000  |
#| 2           | Senior     | 20000  |
#| 11          | Senior     | 20000  |
#| 13          | Senior     | 50000  |
#| 4           | Junior     | 40000  |
#+-------------+------------+--------+
#输出: 
#+------------+---------------------+
#| experience | accepted_candidates |
#+------------+---------------------+
#| Senior     | 2                   |
#| Junior     | 2                   |
#+------------+---------------------+
#说明：
#我们可以雇佣2名ID为（2,11）的高级员工。由于预算是7万美元，他们的工资总额是4万美元，我们还有3万美元，但他们不足以雇佣ID为13的高级员工。
#我们可以雇佣2名ID为（1,9）的初级员工。由于剩下的预算是3万美元，他们的工资总额是2万美元，我们还有1万美元，但他们不足以雇佣ID为4的初级员工。
# 
#
#示例 2：
#
# 
#输入: 
#Candidates table:
#+-------------+------------+--------+
#| employee_id | experience | salary |
#+-------------+------------+--------+
#| 1           | Junior     | 10000  |
#| 9           | Junior     | 10000  |
#| 2           | Senior     | 80000  |
#| 11          | Senior     | 80000  |
#| 13          | Senior     | 80000  |
#| 4           | Junior     | 40000  |
#+-------------+------------+--------+
#输出: 
#+------------+---------------------+
#| experience | accepted_candidates |
#+------------+---------------------+
#| Senior     | 0                   |
#| Junior     | 3                   |
#+------------+---------------------+
#解释：
#我们不能用目前的预算雇佣任何高级员工，因为我们需要至少80000美元来雇佣一名高级员工。
#我们可以用剩下的预算雇佣三名初级员工。 
#
# Related Topics 数据库 👍 7 👎 0

public class TheNumberOfSeniorsAndJuniorsToJoinTheCompany{
	public static void main(String[] args) {
		Solution solution = new TheNumberOfSeniorsAndJuniorsToJoinTheCompany().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

with t as (
select *,sum(salary) over(partition by experience order by salary) total from Candidates
),
tmp as (
select 'Senior' experience,count(employee_id) count,ifnull(max(total),0) total from t
where total<=70000 and experience='Senior'
)
select experience,count accepted_candidates from tmp
union all
-- select 'Junior' experience,count(a.employee_id) accepted_candidates from t a,tmp b
-- where a.experience='Junior' and a.total<=70000-b.total
select 'Junior' experience,count(a.employee_id) accepted_candidates from t a
where a.experience='Junior' and a.total<=70000-(select total from tmp)

-- WITH SeniorTotal AS
-- (SELECT employee_id, SUM(salary) OVER (ORDER BY salary) AS totalone
-- FROM Candidates
-- WHERE experience = 'Senior'),
--
-- SeniorNumber AS
-- (SELECT MAX(totalone) totals
-- FROM SeniorTotal
-- WHERE totalone <= 70000),
--
-- JuniorTotal  AS
-- (SELECT employee_id, SUM(salary) OVER (ORDER BY salary) AS totaltwo
-- FROM Candidates
-- WHERE experience = 'Junior')
--
-- SELECT 'Senior' AS experience, COUNT(DISTINCT employee_id) AS accepted_candidates
-- FROM SeniorTotal
-- WHERE totalone <= 70000
-- UNION ALL
-- SELECT 'Junior' AS experience, COUNT(DISTINCT employee_id) AS accepted_candidates
-- FROM JuniorTotal, SeniorNumber
-- WHERE totaltwo < 70000 - IFNULL(totals, 0)

#leetcode submit region end(Prohibit modification and deletion)

}
