package leetcode.editor.cn;

#表名: Friendship 
#
# 
#+-------------+------+
#| 列名         | 类型 |
#+-------------+------+
#| user1_id    | int  |
#| user2_id    | int  |
#+-------------+------+
#(user1_id, user2_id) 是这个表的主键（具有唯一值的列）。
#这张表的每一行都表示用户 user1_id 和 user2_id 是朋友。
#请注意，user1_id < user2_id。
# 
#
# 
#
# 如果 x 和 y 为朋友且他们至少有三个共同的朋友 ，那么 x 和 y 之间的友谊就是坚定的。 
#
# 写一个解决方案来找到所有的坚定的友谊。 
#
# 注意，结果表不应该包含重复，并且 user1_id < user2_id。 
#
# 以任何顺序返回结果表。 
#
# 返回结果各式如下例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#表 Friendship:
#+----------+----------+
#| user1_id | user2_id |
#+----------+----------+
#| 1        | 2        |
#| 1        | 3        |
#| 2        | 3        |
#| 1        | 4        |
#| 2        | 4        |
#| 1        | 5        |
#| 2        | 5        |
#| 1        | 7        |
#| 3        | 7        |
#| 1        | 6        |
#| 3        | 6        |
#| 2        | 6        |
#+----------+----------+
#输出: 
#+----------+----------+---------------+
#| user1_id | user2_id | common_friend |
#+----------+----------+---------------+
#| 1        | 2        | 4             |
#| 1        | 3        | 3             |
#+----------+----------+---------------+
#解释: 
#用户 1 和 2 有 4 个共同的朋友（3，4，5，和 6）。
#用户 1 和 3 有 3 个共同的朋友（2，6，和 7）。
#但这里不包括用户 2 和 3 的友谊，因为他们只有两个共同的朋友（1 和 6）。
# 
#
# Related Topics 数据库 👍 34 👎 0

public class StrongFriendship{
	public static void main(String[] args) {
		Solution solution = new StrongFriendship().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- with t as (
-- select user1_id,user2_id from Friendship
-- union all
-- select user2_id,user1_id from Friendship
-- )
-- select t1.user1_id,t2.user1_id user2_id,count(distinct t1.user2_id) common_friend from t t1,t t2
-- where (t1.user1_id,t2.user1_id) in (select * from t)
-- and t1.user2_id=t2.user2_id
-- and t1.user1_id<t2.user1_id
-- group by t1.user1_id,t2.user1_id
-- having count(distinct t1.user2_id)>=3

with t as (
select user1_id,user2_id from Friendship
union all
select user2_id,user1_id from Friendship
)

select a.user1_id,a.user2_id,count(*) common_friend
from Friendship a inner join t b
on a.user1_id=b.user1_id
inner join t c on a.user2_id=c.user1_id
and b.user2_id=c.user2_id
group by a.user1_id,a.user2_id
having count(*)>=3

#leetcode submit region end(Prohibit modification and deletion)

}
