package leetcode.editor.cn;

#表：DailySales 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| date_id     | date    |
#| make_name   | varchar |
#| lead_id     | int     |
#| partner_id  | int     |
#+-------------+---------+
#该表没有主键(具有唯一值的列)。它可能包含重复项。
#该表包含日期、产品的名称，以及售给的领导和合伙人的编号。
#名称只包含小写英文字母。 
#
# 
#
# 对于每一个 date_id 和 make_name，找出 不同 的 lead_id 以及 不同 的 partner_id 的数量。 
#
# 按 任意顺序 返回结果表。 
#
# 返回结果格式如下示例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#DailySales 表：
#+-----------+-----------+---------+------------+
#| date_id   | make_name | lead_id | partner_id |
#+-----------+-----------+---------+------------+
#| 2020-12-8 | toyota    | 0       | 1          |
#| 2020-12-8 | toyota    | 1       | 0          |
#| 2020-12-8 | toyota    | 1       | 2          |
#| 2020-12-7 | toyota    | 0       | 2          |
#| 2020-12-7 | toyota    | 0       | 1          |
#| 2020-12-8 | honda     | 1       | 2          |
#| 2020-12-8 | honda     | 2       | 1          |
#| 2020-12-7 | honda     | 0       | 1          |
#| 2020-12-7 | honda     | 1       | 2          |
#| 2020-12-7 | honda     | 2       | 1          |
#+-----------+-----------+---------+------------+
#输出：
#+-----------+-----------+--------------+-----------------+
#| date_id   | make_name | unique_leads | unique_partners |
#+-----------+-----------+--------------+-----------------+
#| 2020-12-8 | toyota    | 2            | 3               |
#| 2020-12-7 | toyota    | 1            | 2               |
#| 2020-12-8 | honda     | 2            | 2               |
#| 2020-12-7 | honda     | 3            | 2               |
#+-----------+-----------+--------------+-----------------+
#解释：
#在 2020-12-8，丰田（toyota）有领导者 = [0, 1] 和合伙人 = [0, 1, 2] ，同时本田（honda）有领导者 = [1, 2] 
#和合伙人 = [1, 2]。
#在 2020-12-7，丰田（toyota）有领导者 = [0] 和合伙人 = [1, 2] ，同时本田（honda）有领导者 = [0, 1, 2] 和合伙
#人 = [1, 2]。 
#
# Related Topics 数据库 👍 47 👎 0

public class DailyLeadsAndPartners{
	public static void main(String[] args) {
		Solution solution = new DailyLeadsAndPartners().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select date_id,make_name,count(distinct lead_id) unique_leads,count(distinct partner_id) unique_partners
from DailySales group by date_id,make_name

#leetcode submit region end(Prohibit modification and deletion)

}
