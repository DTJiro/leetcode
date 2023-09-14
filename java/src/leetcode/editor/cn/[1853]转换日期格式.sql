package leetcode.editor.cn;

#表: Days 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| day         | date |
#+-------------+------+
#day 是这个表的主键。
# 
#
# 
#
# 给定一个Days表，请你编写SQL查询语句，将Days表中的每一个日期转化为"day_name, month_name day, year"格式的字符串。 
#
#
# 返回的结果表 不计顺序 。 
#
# 查询结果格式如下例所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Days table:
#+------------+
#| day        |
#+------------+
#| 2022-04-12 |
#| 2021-08-09 |
#| 2020-06-26 |
#+------------+
#输出：
#+-------------------------+
#| day                     |
#+-------------------------+
#| Tuesday, April 12, 2022 |
#| Monday, August 9, 2021  |
#| Friday, June 26, 2020   |
#+-------------------------+
#解释：请注意，输出对大小写敏感。 
#
# Related Topics 数据库 👍 14 👎 0

public class ConvertDateFormat{
	public static void main(String[] args) {
		Solution solution = new ConvertDateFormat().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select concat(
-- week, ', ', month, ' ', day, ', ',year) day
-- from (select dayname(day) week,MONTHNAME(day) month,day(day) day,year(day) year from Days) a

SELECT DATE_FORMAT(day, '%W, %M %e, %Y') AS 'day' FROM Days

#leetcode submit region end(Prohibit modification and deletion)

}
