package leetcode.editor.cn;

#表：Data 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| first_col   | int  |
#| second_col  | int  |
#+-------------+------+
#该表可能包含重复数据。
# 
#
# 
#
# 编写解决方案，使： 
#
# 
# first_col 按照 升序 排列。 
# second_col 按照 降序 排列。 
# 
#
# 返回的结果格式如下。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Data 表：
#+-----------+------------+
#| first_col | second_col |
#+-----------+------------+
#| 4         | 2          |
#| 2         | 3          |
#| 3         | 1          |
#| 1         | 4          |
#+-----------+------------+
#输出：
#+-----------+------------+
#| first_col | second_col |
#+-----------+------------+
#| 1         | 4          |
#| 2         | 3          |
#| 3         | 2          |
#| 4         | 1          |
#+-----------+------------+
# 
#
# Related Topics 数据库 👍 4 👎 0

public class OrderTwoColumnsIndependently{
	public static void main(String[] args) {
		Solution solution = new OrderTwoColumnsIndependently().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.first_col,b.second_col from
(select first_col,row_number() over(order by first_col) rn from Data) a
left join (select second_col,row_number() over(order by second_col desc) rn from Data) b
on a.rn=b.rn
order by a.rn

#leetcode submit region end(Prohibit modification and deletion)

}
