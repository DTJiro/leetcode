package leetcode.editor.cn;

#表： Steps 
#
# 
#+-------------+------+ 
#| Column Name | Type | 
#+-------------+------+ 
#| user_id     | int  | 
#| steps_count | int  |
#| steps_date  | date |
#+-------------+------+
#(user_id, steps_date) 是此表的主键。
#该表的每一行包含 user_id、steps_count 和 steps_date。
# 
#
# 编写一个解决方案，计算出每个用户的 3-day 滚动平均步数 。 
#
# 计算 n-day 滚动平均值 的计算方式如下： 
#
# 
# 对于每一天，如果有可用数据的情况下，我们会计算以该天为结束的 n 天连续步数的平均值，否则，对于该天来说，n 天滚动平均步数是未定义的。 
# 
#
# 输出 user_id 、 steps_date 和滚动平均值。并将滚动平均值四舍五入到 两位小数。 
#
# 返回结果表以user_id 和 steps_date 升序 排序。 
#
# 结果的格式如下示例。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Steps table:
#+---------+-------------+------------+
#| user_id | steps_count | steps_date |
#+---------+-------------+------------+
#| 1       | 687         | 2021-09-02 |
#| 1       | 395         | 2021-09-04 |
#| 1       | 499         | 2021-09-05 |
#| 1       | 712         | 2021-09-06 |
#| 1       | 576         | 2021-09-07 |
#| 2       | 153         | 2021-09-06 |
#| 2       | 171         | 2021-09-07 |
#| 2       | 530         | 2021-09-08 |
#| 3       | 945         | 2021-09-04 |
#| 3       | 120         | 2021-09-07 |
#| 3       | 557         | 2021-09-08 |
#| 3       | 840         | 2021-09-09 |
#| 3       | 627         | 2021-09-10 |
#| 5       | 382         | 2021-09-05 |
#| 6       | 480         | 2021-09-01 |
#| 6       | 191         | 2021-09-02 |
#| 6       | 303         | 2021-09-05 |
#+---------+-------------+------------+
#输出：
#+---------+------------+-----------------+
#| user_id | steps_date | rolling_average | 
#+---------+------------+-----------------+
#| 1       | 2021-09-06 | 535.33          | 
#| 1       | 2021-09-07 | 595.67          | 
#| 2       | 2021-09-08 | 284.67          |
#| 3       | 2021-09-09 | 505.67          |
#| 3       | 2021-09-10 | 674.67          |    
#+---------+------------+-----------------+
#解释：
#- 对于 ID 为 1 的用户，截止到 2021-09-06 的三天连续的步数可用。因此，该日期的滚动平均值计算为 (395 + 499 + 712) / 3
# = 535.33。
#- 对于 ID 为 1 的用户，截止到 2021-09-07 的三天连续的步数可用。因此，该日期的滚动平均值计算为 (499 + 712 + 576) / 3
# = 595.67。
#- 对于 ID 为 2 的用户，截止到 2021-09-08 的三天连续的步数可用。因此，该日期的滚动平均值计算为 (153 + 171 + 530) / 3
# = 284.67。
#- 对于 ID 为 3 的用户，截止到 2021-09-09 的三天连续的步数可用。因此，该日期的滚动平均值计算为 (120 + 557 + 840) / 3
# = 505.67。
#- 对于 ID 为 3 的用户，截止到 2021-09-10 的三天连续的步数可用。因此，该日期的滚动平均值计算为 (557 + 840 + 627) / 3
# = 674.67。
#- 对于 ID 为 4 和 5 的用户，由于连续三天的数据不足，无法计算滚动平均值。结果表按 user_id 和 steps_date 升序排序。 
#
# Related Topics 数据库 👍 0 👎 0

public class RollingAverageSteps{
	public static void main(String[] args) {
		Solution solution = new RollingAverageSteps().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.user_id,a.steps_date,round(avg(b.steps_count),2) rolling_average from Steps a join Steps b on a.user_id=b.user_id and
datediff(a.steps_date,b.steps_date) between 0 and 2
group by a.user_id,a.steps_date having count(b.steps_date)=3
order by a.user_id,a.steps_date

#leetcode submit region end(Prohibit modification and deletion)

}
