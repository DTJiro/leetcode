package leetcode.editor.cn;

#表： Orders 
#
# 
#+-------------+------+ 
#| Column Name | Type | 
#+-------------+------+ 
#| minute      | int  | 
#| order_count | int  |
#+-------------+------+
#minute 是该表的主键。
#该表的每一行包含分钟数以及在特定分钟数内收到的订单数量。总行数将是 6 的倍数。 
#
# 编写一个查询，计算每个 区间 内的 总订单数量。 每个区间被定义为 6 分钟的组合。 
#
# 
# 1 到 6 分钟属于第 1 个区间，而 7 到 12 分钟属于第 2 个区间，以此类推。 
# 
#
# 按 升序顺序 返回结果表，按 interval_no 排序。 
#
# 结果表的格式如下示例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Orders table:
#+--------+-------------+
#| minute | order_count | 
#+--------+-------------+
#| 1      | 0           |
#| 2      | 2           | 
#| 3      | 4           | 
#| 4      | 6           | 
#| 5      | 1           | 
#| 6      | 4           | 
#| 7      | 1           | 
#| 8      | 2           | 
#| 9      | 4           | 
#| 10     | 1           | 
#| 11     | 4           | 
#| 12     | 6           | 
#+--------+-------------+
#输出：
#+-------------+--------------+
#| interval_no | total_orders | 
#+-------------+--------------+
#| 1           | 17           | 
#| 2           | 18           |    
#+-------------+--------------+
#解释：
#- 区间号 1 包括从 1 到 6 分钟的时间。这 6 分钟内的总订单数量为 (0 + 2 + 4 + 6 + 1 + 4) = 17。
#- 区间号 2 包括从 7 到 12 分钟的时间。这 6 分钟内的总订单数量为 (1 + 2 + 4 + 1 + 4 + 6) = 18。
#按升序顺序返回结果表，按 interval_no 排序。 
#
# Related Topics 数据库 👍 0 👎 0

public class CalculateOrdersWithinEachInterval{
	public static void main(String[] args) {
		Solution solution = new CalculateOrdersWithinEachInterval().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select ceil(minute/6) interval_no,sum(order_count) total_orders from Orders group by ceil(minute/6) order by interval_no

#leetcode submit region end(Prohibit modification and deletion)

}
