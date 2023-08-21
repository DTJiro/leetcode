package leetcode.editor.cn;

#表: Points 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| id            | int     |
#| x_value       | int     |
#| y_value       | int     |
#+---------------+---------+
#id 是该表中具有唯一值的列。
#每个点都用二维坐标 (x_value, y_value) 表示。 
#
# 
#
# 编写解决方案，报告由表中任意两点可以形成的所有 边与坐标轴平行 且 面积不为零 的矩形。 
#
# 结果表中的每一行包含三列 (p1, p2, area) 如下: 
#
# 
# p1 和 p2 是矩形两个对角的 id 
# 矩形的面积由列 area 表示 
# 
#
# 返回结果表请按照面积 area 大小 降序排列；如果面积相同的话, 则按照 p1 升序排序；若仍相同，则按 p2 升序排列。 
#
# 返回结果格式如下例所示： 
#
# 
#
# 示例 1： 
#
# 
#
# 
#输入：
#Points 表:
#+----------+-------------+-------------+
#| id       | x_value     | y_value     |
#+----------+-------------+-------------+
#| 1        | 2           | 7           |
#| 2        | 4           | 8           |
#| 3        | 2           | 10          |
#+----------+-------------+-------------+
#输出：
#+----------+-------------+-------------+
#| p1       | p2          | area        |
#+----------+-------------+-------------+
#| 2        | 3           | 4           |
#| 1        | 2           | 2           |
#+----------+-------------+-------------+
#解释：
#p1 = 2 且 p2 = 3 时, 面积等于 |4-2| * |8-10| = 4
#p1 = 1 且 p2 = 2 时, 面积等于 ||2-4| * |7-8| = 2 
#p1 = 1 且 p2 = 3 时, 是不可能为矩形的, 面积等于 0
# 
#
# Related Topics 数据库 👍 19 👎 0

public class RectanglesArea{
	public static void main(String[] args) {
		Solution solution = new RectanglesArea().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.id p1,b.id p2,abs(a.x_value-b.x_value)*abs(a.y_value-b.y_value) area from Points a inner join Points b
on a.x_value!=b.x_value and a.y_value!=b.y_value and a.id<b.id
order by area desc,a.id,b.id

#leetcode submit region end(Prohibit modification and deletion)

}
