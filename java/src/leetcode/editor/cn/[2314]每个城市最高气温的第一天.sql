package leetcode.editor.cn;

#表: Weather 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| city_id     | int  |
#| day         | date |
#| degree      | int  |
#+-------------+------+
#(city_id, day) 是该表的主键（具有唯一值的列的组合）。
#该表中的每一行都包含某一天某个城市的天气程度。
#所有的学位都是在 2022 年获得的。
# 
#
# 
#
# 编写解决方案，找出每个城市中有最高温度记录的日子。如果同一城市多次记录最高气温，则返回其中最早的一天。 
#
# 返回按 city_id 升序排序 的结果表。 
#
# 查询结果格式示例如下。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Weather 表:
#+---------+------------+--------+
#| city_id | day        | degree |
#+---------+------------+--------+
#| 1       | 2022-01-07 | -12    |
#| 1       | 2022-03-07 | 5      |
#| 1       | 2022-07-07 | 24     |
#| 2       | 2022-08-07 | 37     |
#| 2       | 2022-08-17 | 37     |
#| 3       | 2022-02-07 | -7     |
#| 3       | 2022-12-07 | -6     |
#+---------+------------+--------+
#输出: 
#+---------+------------+--------+
#| city_id | day        | degree |
#+---------+------------+--------+
#| 1       | 2022-07-07 | 24     |
#| 2       | 2022-08-07 | 37     |
#| 3       | 2022-12-07 | -6     |
#+---------+------------+--------+
#解释: 
#城市 1 的最高气温出现在 2022-07-07，为24度。
#城市 2 的最高气温出现在 2022-08-07 和 2022-08-17，为37度。我们选择较早的日期 (2022-08-07)。
#城市 3 的最高气温记录在 2022-12-07 年，为-6 度。
# 
#
# Related Topics 数据库 👍 3 👎 0

public class TheFirstDayOfTheMaximumRecordedDegreeInEachCity{
	public static void main(String[] args) {
		Solution solution = new TheFirstDayOfTheMaximumRecordedDegreeInEachCity().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select city_id,day,degree from
(select *,dense_rank() over(partition by city_id order by degree desc,day) rn from Weather) a
where rn=1 order by city_id

#leetcode submit region end(Prohibit modification and deletion)

}
