package leetcode.editor.cn;

#部门表 Department： 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| id            | int     |
#| revenue       | int     |
#| month         | varchar |
#+---------------+---------+
#(id, month) 是表的联合主键。
#这个表格有关于每个部门每月收入的信息。
#月份（month）可以取下列值 ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct",
#"Nov","Dec"]。
# 
#
# 
#
# 编写一个 SQL 查询来重新格式化表，使得新的表中有一个部门 id 列和一些对应 每个月 的收入（revenue）列。 
#
# 查询结果格式如下面的示例所示： 
#
# 
#Department 表：
#+------+---------+-------+
#| id   | revenue | month |
#+------+---------+-------+
#| 1    | 8000    | Jan   |
#| 2    | 9000    | Jan   |
#| 3    | 10000   | Feb   |
#| 1    | 7000    | Feb   |
#| 1    | 6000    | Mar   |
#+------+---------+-------+
#
#查询得到的结果表：
#+------+-------------+-------------+-------------+-----+-------------+
#| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
#+------+-------------+-------------+-------------+-----+-------------+
#| 1    | 8000        | 7000        | 6000        | ... | null        |
#| 2    | 9000        | null        | null        | ... | null        |
#| 3    | null        | 10000       | null        | ... | null        |
#+------+-------------+-------------+-------------+-----+-------------+
#
#注意，结果表有 13 列 (1个部门 id 列 + 12个月份的收入列)。
# 
#
# Related Topics 数据库 👍 232 👎 0

public class ReformatDepartmentTable{
	public static void main(String[] args) {
		Solution solution = new ReformatDepartmentTable().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select id,
sum(case when month='Jan' then revenue else null end) Jan_Revenue,
sum(case when month='Feb' then revenue else null end) Feb_Revenue,
sum(case when month='Mar' then revenue else null end) Mar_Revenue,
sum(case when month='Apr' then revenue else null end) Apr_Revenue,
sum(case when month='May' then revenue else null end) May_Revenue,
sum(case when month='Jun' then revenue else null end) Jun_Revenue,
sum(case when month='Jul' then revenue else null end) Jul_Revenue,
sum(case when month='Aug' then revenue else null end) Aug_Revenue,
sum(case when month='Sep' then revenue else null end) Sep_Revenue,
sum(case when month='Oct' then revenue else null end) Oct_Revenue,
sum(case when month='Nov' then revenue else null end) Nov_Revenue,
sum(case when month='Dec' then revenue else null end) Dec_Revenue
from Department group by id

#leetcode submit region end(Prohibit modification and deletion)

}
