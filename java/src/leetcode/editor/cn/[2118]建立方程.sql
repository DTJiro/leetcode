package leetcode.editor.cn;

#表: Terms
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| power       | int  |
#| factor      | int  |
#+-------------+------+
#power 是该表具有唯一值的列。
#该表的每一行包含关于方程的一项的信息。
#power 是范围为 [0, 100] 的整数。
#factor 是范围为 [-100,100] 的整数，且不能为零。
#
#
#
#
# 你有一个非常强大的程序，可以解决世界上任何单变量的方程。传递给程序的方程必须格式化如下:
#
# 
# 左边 (LHS) 应该包含所有的术语。 
# 右边 (RHS) 应该是零。 
# LHS 的每一项应遵循 "<sign><fact>X^<pow>" 的格式，其中: 
# 
# <sign> 是 "+" 或者 "-"。 
# <fact> 是 factor 的 绝对值。 
# <pow> 是 power 的值。 
# 
# 如果幂是 1, 不要加上 "^<pow>". 
# 
# 例如, 如果 power = 1 并且 factor = 3, 将有 "+3X"。 
# 
# 如果幂是 0, 不要加上 "X" 和 "^<pow>". 
# 
# 例如, 如果 power = 0 并且 factor = -3, 将有 "-3"。 
# 
# LHS 中的幂应该按 降序排序。 
# 
#
# 编写一个解决方案来构建方程。 
#
# 结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Terms 表:
#+-------+--------+
#| power | factor |
#+-------+--------+
#| 2     | 1      |
#| 1     | -4     |
#| 0     | 2      |
#+-------+--------+
#输出: 
#+--------------+
#| equation     |
#+--------------+
#| +1X^2-4X+2=0 |
#+--------------+
# 
#
# 示例 2： 
#
# 
#输入: 
#Terms 表:
#+-------+--------+
#| power | factor |
#+-------+--------+
#| 4     | -4     |
#| 2     | 1      |
#| 1     | -1     |
#+-------+--------+
#输出: 
#+-----------------+
#| equation        |
#+-----------------+
#| -4X^4+1X^2-1X=0 |
#+-----------------+
# 
#
# 
#
# 扩展: 如果幂函数不是主键，但每个幂函数在答案中都是唯一的，那么解决方案中需要改变什么? 
#
# Related Topics 数据库 👍 4 👎 0

public class BuildTheEquation{
	public static void main(String[] args) {
		Solution solution = new BuildTheEquation().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- with t as (
-- select * from Terms order by power desc
-- ),t1 as (
-- select case when power=0 then ''
--         when power=1 then 'X'
--         else concat('X^',power) end str,factor,power
-- from t
-- ),t2 as (
-- select if(factor<0,concat(factor,str),concat('+',factor,str)) s,power from t1
-- )
--
-- select concat(group_concat(s order by power desc SEPARATOR ''),'=0') equation from t2

select concat(group_concat(term order by power desc SEPARATOR ''), '=0') as equation
from
    (select power,
            concat(if(factor>0,'+',''), factor, case power when 1 then 'X' when 0 then '' else concat('X^',power) end) as term
     from Terms)a


#leetcode submit region end(Prohibit modification and deletion)

}
