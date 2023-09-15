package leetcode.editor.cn;

#表: Accounts 
#
# 
#+-------------+------+
#| 列名        | 类型  |
#+-------------+------+
#| account_id  | int  |
#| income      | int  |
#+-------------+------+
#在 SQL 中，account_id 是这个表的主键。
#每一行都包含一个银行帐户的月收入的信息。
# 
#
# 
#
# 查询每个工资类别的银行账户数量。 工资类别如下： 
#
# 
# "Low Salary"：所有工资 严格低于 20000 美元。 
# "Average Salary"： 包含 范围内的所有工资 [$20000, $50000] 。 
# "High Salary"：所有工资 严格大于 50000 美元。 
# 
#
# 结果表 必须 包含所有三个类别。 如果某个类别中没有帐户，则报告 0 。 
#
# 按 任意顺序 返回结果表。 
#
# 查询结果格式如下示例。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Accounts 表:
#+------------+--------+
#| account_id | income |
#+------------+--------+
#| 3          | 108939 |
#| 2          | 12747  |
#| 8          | 87709  |
#| 6          | 91796  |
#+------------+--------+
#输出：
#+----------------+----------------+
#| category       | accounts_count |
#+----------------+----------------+
#| Low Salary     | 1              |
#| Average Salary | 0              |
#| High Salary    | 3              |
#+----------------+----------------+
#解释：
#低薪: 有一个账户 2.
#中等薪水: 没有.
#高薪: 有三个账户，他们是 3, 6和 8. 
#
# Related Topics 数据库 👍 31 👎 0

public class CountSalaryCategories{
	public static void main(String[] args) {
		Solution solution = new CountSalaryCategories().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select a.name category,ifnull(c.count,0) accounts_count from
-- (select 'Low Salary' name
-- union
-- select 'Average Salary' name
-- union
-- select 'High Salary' name) a left join
-- (select type,count(*) count from
-- (select *,case when income<20000 then 'Low Salary'
-- when income between 20000 and 50000 then 'Average Salary'
-- else 'High Salary' end type
-- from Accounts) b group by type) c on a.name=c.type

SELECT
    'Low Salary' AS category,
    SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS accounts_count
FROM
    Accounts

UNION
SELECT
    'Average Salary' category,
    SUM(CASE WHEN income >= 20000 AND income <= 50000 THEN 1 ELSE 0 END)
        AS accounts_count
FROM
    Accounts

UNION
SELECT
    'High Salary' category,
    SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END) AS accounts_count
FROM
    Accounts

#leetcode submit region end(Prohibit modification and deletion)

}
