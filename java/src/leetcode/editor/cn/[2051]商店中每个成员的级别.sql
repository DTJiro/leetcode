package leetcode.editor.cn;

#表: Members 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| member_id   | int     |
#| name        | varchar |
#+-------------+---------+
#member_id 是该表的主键。
#该表的每一行都表示成员的名称和 ID。
# 
#
# 
#
# 表: Visits 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| visit_id    | int  |
#| member_id   | int  |
#| visit_date  | date |
#+-------------+------+
#visit_id 是该表的主键。
#member_id 是 Members 表中 member_id 的外键。
#该表的每一行都包含关于访问商店的日期和访问该商店的成员的信息。
# 
#
# 
#
# 表: Purchases 
#
# 
#+----------------+------+
#| Column Name    | Type |
#+----------------+------+
#| visit_id       | int  |
#| charged_amount | int  |
#+----------------+------+
#visit_id 是该表的主键。
#visit_id 是访问表 visit_id 的外键。
#该表的每一行都包含了关于在商店中消费的信息。
# 
#
# 
#
# 一个商店想对其成员进行分类。有三个层次: 
#
# 
# "钻石": 如果转换率 大于或等于 80. 
# "黄金": 如果转换率 大于或等于 50 且小于 80. 
# "白银": 如果转化率 小于 50. 
# "青铜": 如果该成员从未访问过该商店。 
# 
#
# 成员的 转化率 为 (100 * 该会员的购买总数) / 该成员的总访问次数. 
#
# 编写一个 SQL 来查询每个成员的 id、名称和类别。 
#
# 以 任意顺序 返回结果表。 
#
# 查询结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Members 表:
#+-----------+---------+
#| member_id | name    |
#+-----------+---------+
#| 9         | Alice   |
#| 11        | Bob     |
#| 3         | Winston |
#| 8         | Hercy   |
#| 1         | Narihan |
#+-----------+---------+
#Visits 表:
#+----------+-----------+------------+
#| visit_id | member_id | visit_date |
#+----------+-----------+------------+
#| 22       | 11        | 2021-10-28 |
#| 16       | 11        | 2021-01-12 |
#| 18       | 9         | 2021-12-10 |
#| 19       | 3         | 2021-10-19 |
#| 12       | 11        | 2021-03-01 |
#| 17       | 8         | 2021-05-07 |
#| 21       | 9         | 2021-05-12 |
#+----------+-----------+------------+
#Purchases 表:
#+----------+----------------+
#| visit_id | charged_amount |
#+----------+----------------+
#| 12       | 2000           |
#| 18       | 9000           |
#| 17       | 7000           |
#+----------+----------------+
#输出: 
#+-----------+---------+----------+
#| member_id | name    | category |
#+-----------+---------+----------+
#| 1         | Narihan | Bronze   |
#| 3         | Winston | Silver   |
#| 8         | Hercy   | Diamond  |
#| 9         | Alice   | Gold     |
#| 11        | Bob     | Silver   |
#+-----------+---------+----------+
#解释: 
#- id = 1 的成员 Narihan 没有访问过该商店。她获得了铜奖。
#- id = 3 的成员 Winston 访问了商店一次，但没有购买任何东西。转化率=(100 * 0)/ 1 = 0。他获得了银奖。
#- id = 8 的成员 Hercy 访问商店一次，购买一次。转化率=(100 * 1)/ 1 = 1。他获得了钻石奖。
#- id = 9 的成员 Alice 访问了商店两次，购买了一次。转化率=(100 * 1)/ 2 = 50。她获得了金奖。
#- id = 11 的用户 Bob 访问了商店三次，购买了一次。转化率=(100 * 1)/ 3 = 33.33。他获得了银奖。 
#
# Related Topics 数据库 👍 4 👎 0

public class TheCategoryOfEachMemberInTheStore{
	public static void main(String[] args) {
		Solution solution = new TheCategoryOfEachMemberInTheStore().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.member_id,a.name,case when count(b.visit_id) =0 then 'Bronze'
    when count(c.charged_amount)*100/count(b.visit_id)>=80 then 'Diamond'
    when count(c.charged_amount)*100/count(b.visit_id)>=50 then 'Gold'
    else 'Silver' end category
from Members a left join Visits b on a.member_id=b.member_id
left join Purchases c on b.visit_id=c.visit_id
group by a.member_id,a.name

#leetcode submit region end(Prohibit modification and deletion)

}
