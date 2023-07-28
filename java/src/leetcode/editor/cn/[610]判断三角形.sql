package leetcode.editor.cn;

#表: Triangle 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| x           | int  |
#| y           | int  |
#| z           | int  |
#+-------------+------+
#(x, y, z)是该表的主键列。
#该表的每一行包含三个线段的长度。
# 
#
# 
#
# 写一个SQL查询，每三个线段报告它们是否可以形成一个三角形。 
#
# 以 任意顺序 返回结果表。 
#
# 查询结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Triangle 表:
#+----+----+----+
#| x  | y  | z  |
#+----+----+----+
#| 13 | 15 | 30 |
#| 10 | 20 | 15 |
#+----+----+----+
#输出: 
#+----+----+----+----------+
#| x  | y  | z  | triangle |
#+----+----+----+----------+
#| 13 | 15 | 30 | No       |
#| 10 | 20 | 15 | Yes      |
#+----+----+----+----------+ 
#
# Related Topics 数据库 👍 52 👎 0

public class TriangleJudgement{
	public static void main(String[] args) {
		Solution solution = new TriangleJudgement().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select *,case when x+y>z and x+z>y and y+z>x then 'Yes' else 'No' end triangle
from Triangle

#leetcode submit region end(Prohibit modification and deletion)

}
