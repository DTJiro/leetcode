package leetcode.editor.cn;

#表：Users 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| user_id     | int     |
#| name        | varchar |
#+-------------+---------+
#user_id 是此表中具有唯一值的列。 
#此表的每一行包含用户 id 和姓名。
# 
#
# 表：Rides 
#
# 
#+--------------+------+
#| Column Name  | Type |
#+--------------+------+
#| ride_id      | int  |
#| user_id      | int  | 
#| distance     | int  |
#+--------------+------+
#ride_id 是此表中具有唯一值的列。 
#此表中的每一行包含乘车 id、用户 id 和旅行距离。
# 
#
# 编写一个解决方案，计算每个用户的旅行距离 distance 。如果有用户没有任何旅行记录，那么他们的 distance 应被视为 0 。输出 user_
#id, name 和总旅行距离 traveled distance 。 
#
# 按 升序排序 的 user_id 返回结果表。 
#
# 结果格式如下示例。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Users table:
#+---------+---------+
#| user_id | name    |
#+---------+---------+
#| 17      | Addison |
#| 14      | Ethan   |
#| 4       | Michael |
#| 2       | Avery   |
#| 10      | Eleanor |
#+---------+---------+
#Rides table:
#+---------+---------+----------+
#| ride_id | user_id | distance |
#+---------+---------+----------+
#| 72      | 17      | 160      |
#| 42      | 14      | 161      |
#| 45      | 4       | 59       |
#| 32      | 2       | 197      |
#| 15      | 4       | 357      |
#| 56      | 2       | 196      |
#| 10      | 14      | 25       |
#+---------+---------+----------+
#输出：
#+---------+---------+-------------------+
#| user_id | name    | traveled distance |
#+---------+---------+-------------------+
#| 2       | Avery   | 393               |
#| 4       | Michael | 416               |
#| 10      | Eleanor | 0                 |
#| 14      | Ethan   | 186               |
#| 17      | Addison | 160               |
#+---------+---------+-------------------+
#解释：
#-  User id 为 2 的用户完成了两次旅行，分别为 197 和 196，总旅行距离为 393。
#-  User id 为 4 的用户完成了两次旅行，分别为 59 和 357，总旅行距离为 416。
#-  User id 为 14 的用户完成了两次旅行，分别为 161 和 25，总旅行距离为 186。
#-  User id 为 16 的用户只完成了一次旅行，距离为 160。
#-  User id 为 10 的用户没有完成任何旅行，因此总旅行距离为 0。
#按升序排序的 user_id 返回结果表 
#
# Related Topics 数据库 👍 0 👎 0

public class TotalTraveledDistance{
	public static void main(String[] args) {
		Solution solution = new TotalTraveledDistance().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.user_id,a.name,ifnull(sum(distance),0) 'traveled distance' from Users a left join Rides b on a.user_id=b.user_id
group by a.user_id,a.name
order by a.user_id

#leetcode submit region end(Prohibit modification and deletion)

}
