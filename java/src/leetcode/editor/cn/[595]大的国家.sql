package leetcode.editor.cn;

#World 表： 
#
# 
# 
# 
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| name        | varchar |
#| continent   | varchar |
#| area        | int     |
#| population  | int     |
#| gdp         | bigint  |
#+-------------+---------+
#在 SQL 中，name 是这张表的主键。
#这张表的每一行提供：国家名称、所属大陆、面积、人口和 GDP 值。
# 
# 
# 
# 
#
# 
#
# 如果一个国家满足下述两个条件之一，则认为该国是 大国 ： 
#
# 
# 面积至少为 300 万平方公里（即，3000000 km²），或者 
# 人口至少为 2500 万（即 25000000） 
# 
#
# 查询并报告 大国 的国家名称、人口和面积。 
#
# 按 任意顺序 返回结果表。 
#
# 查询结果格式如下例所示。 
#
# 
#
# 示例： 
#
# 
#输入：
#World 表：
#+-------------+-----------+---------+------------+--------------+
#| name        | continent | area    | population | gdp          |
#+-------------+-----------+---------+------------+--------------+
#| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
#| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
#| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
#| Andorra     | Europe    | 468     | 78115      | 3712000000   |
#| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
#+-------------+-----------+---------+------------+--------------+
#输出：
#+-------------+------------+---------+
#| name        | population | area    |
#+-------------+------------+---------+
#| Afghanistan | 25500100   | 652230  |
#| Algeria     | 37100000   | 2381741 |
#+-------------+------------+---------+
# 
#
#
# 👍 359 👎 0

public class BigCountries{
	public static void main(String[] args) {
		Solution solution = new BigCountries().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select name,population,area from World where area >= 3000000 or population >= 25000000

select name,population,area from World where area >= 3000000
union
select name,population,area from World where population >= 25000000

#leetcode submit region end(Prohibit modification and deletion)

}
