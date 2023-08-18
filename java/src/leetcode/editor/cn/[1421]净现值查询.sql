package leetcode.editor.cn;

#表: NPV 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| id            | int     |
#| year          | int     |
#| npv           | int     |
#+---------------+---------+
#(id, year) 是该表主键(具有唯一值的列的组合).
#该表有每一笔存货的年份, id 和对应净现值的信息.
# 
#
# 
#
# 表: Queries 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| id            | int     |
#| year          | int     |
#+---------------+---------+
#(id, year) 是该表主键(具有唯一值的列的组合).
#该表有每一次查询所对应存货的 id 和年份的信息.
# 
#
# 
#
# 编写解决方案，找到 Queries 表中每一次查询的净现值。 
#
# 结果表 没有顺序要求 。 
#
# 查询结果的格式如下所示: 
#
# 
#
# 示例 1： 
#
# 
#输入：
#NPV 表:
#+------+--------+--------+
#| id   | year   | npv    |
#+------+--------+--------+
#| 1    | 2018   | 100    |
#| 7    | 2020   | 30     |
#| 13   | 2019   | 40     |
#| 1    | 2019   | 113    |
#| 2    | 2008   | 121    |
#| 3    | 2009   | 12     |
#| 11   | 2020   | 99     |
#| 7    | 2019   | 0      |
#+------+--------+--------+
#
#Queries 表:
#+------+--------+
#| id   | year   |
#+------+--------+
#| 1    | 2019   |
#| 2    | 2008   |
#| 3    | 2009   |
#| 7    | 2018   |
#| 7    | 2019   |
#| 7    | 2020   |
#| 13   | 2019   |
#+------+--------+
#输出：
#+------+--------+--------+
#| id   | year   | npv    |
#+------+--------+--------+
#| 1    | 2019   | 113    |
#| 2    | 2008   | 121    |
#| 3    | 2009   | 12     |
#| 7    | 2018   | 0      |
#| 7    | 2019   | 0      |
#| 7    | 2020   | 30     |
#| 13   | 2019   | 40     |
#+------+--------+--------+
#解释：
#(7, 2018)的净现值不在 NPV 表中, 我们把它看作是 0.
#所有其它查询的净现值都能在 NPV 表中找到.
# 
#
# Related Topics 数据库 👍 9 👎 0

public class NpvQueries{
	public static void main(String[] args) {
		Solution solution = new NpvQueries().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.id,a.year,ifnull(b.npv,0) npv from Queries a left join NPV b on a.id=b.id and a.year=b.year

#leetcode submit region end(Prohibit modification and deletion)

}
