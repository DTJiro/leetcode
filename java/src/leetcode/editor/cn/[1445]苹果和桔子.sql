package leetcode.editor.cn;

#表: Sales 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| sale_date     | date    |
#| fruit         | enum    | 
#| sold_num      | int     | 
#+---------------+---------+
#(sale_date, fruit) 是该表主键(具有唯一值的列的组合)。
#该表包含了每一天中"苹果" 和 "桔子"的销售情况。
# 
#
# 
#
# 编写解决方案报告每一天 苹果 和 桔子 销售的数目的差异. 
#
# 返回的结果表, 按照格式为 ('YYYY-MM-DD') 的 sale_date 排序. 
#
# 返回结果表如下例所示: 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Sales 表:
#+------------+------------+-------------+
#| sale_date  | fruit      | sold_num    |
#+------------+------------+-------------+
#| 2020-05-01 | apples     | 10          |
#| 2020-05-01 | oranges    | 8           |
#| 2020-05-02 | apples     | 15          |
#| 2020-05-02 | oranges    | 15          |
#| 2020-05-03 | apples     | 20          |
#| 2020-05-03 | oranges    | 0           |
#| 2020-05-04 | apples     | 15          |
#| 2020-05-04 | oranges    | 16          |
#+------------+------------+-------------+
#输出：
#+------------+--------------+
#| sale_date  | diff         |
#+------------+--------------+
#| 2020-05-01 | 2            |
#| 2020-05-02 | 0            |
#| 2020-05-03 | 20           |
#| 2020-05-04 | -1           |
#+------------+--------------+
#解释：
#在 2020-05-01, 卖了 10 个苹果 和 8 个桔子 (差异为 10 - 8 = 2).
#在 2020-05-02, 卖了 15 个苹果 和 15 个桔子 (差异为 15 - 15 = 0).
#在 2020-05-03, 卖了 20 个苹果 和 0 个桔子 (差异为 20 - 0 = 20).
#在 2020-05-04, 卖了 15 个苹果 和 16 个桔子 (差异为 15 - 16 = -1).
# 
#
# Related Topics 数据库 👍 36 👎 0

public class ApplesOranges{
	public static void main(String[] args) {
		Solution solution = new ApplesOranges().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select sale_date,sum(if(fruit='apples',sold_num,0))-sum(if(fruit='oranges',sold_num,0)) diff from Sales group by sale_date order by sale_date

select sale_date,sum(if(fruit='apples',sold_num,-sold_num)) as diff from Sales group by sale_date order by sale_date
#leetcode submit region end(Prohibit modification and deletion)

}
