package leetcode.editor.cn;

#表: Listens 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| user_id     | int     |
#| song_id     | int     |
#| day         | date    |
#+-------------+---------+
#该表没有主键，因此会存在重复的行。
#该表的每一行所代表的含义是：用户（user_id）在某天（day）听了某首歌曲（song_id）。
# 
#
# 
#
# 表: Friendship 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| user1_id      | int     |
#| user2_id      | int     |
#+---------------+---------+
#(user1_id, user2_id) 是该表的主键。
#该表的每一行所代表的含义是，用户（user1_id, user2_id）是朋友。
#注意：user1_id < user2_id。
# 
#
# 
#
# 请写一段SQL查询获取到兴趣相同的朋友。用户 x 和 用户 y 是兴趣相同的朋友，需满足下述条件： 
#
# 
# 用户 x 和 y 是朋友，并且 
# 用户 x and y 在同一天内听过相同的歌曲，且数量大于等于三首. 
# 
#
# 结果表 无需排序 。注意：返回的结果需要和源数据表的呈现方式相同 （例如， 需满足 user1_id < user2_id）。 
#
# 结果表的格式如下例。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Listens table:
#+---------+---------+------------+
#| user_id | song_id | day        |
#+---------+---------+------------+
#| 1       | 10      | 2021-03-15 |
#| 1       | 11      | 2021-03-15 |
#| 1       | 12      | 2021-03-15 |
#| 2       | 10      | 2021-03-15 |
#| 2       | 11      | 2021-03-15 |
#| 2       | 12      | 2021-03-15 |
#| 3       | 10      | 2021-03-15 |
#| 3       | 11      | 2021-03-15 |
#| 3       | 12      | 2021-03-15 |
#| 4       | 10      | 2021-03-15 |
#| 4       | 11      | 2021-03-15 |
#| 4       | 13      | 2021-03-15 |
#| 5       | 10      | 2021-03-16 |
#| 5       | 11      | 2021-03-16 |
#| 5       | 12      | 2021-03-16 |
#+---------+---------+------------+
#Friendship table:
#+----------+----------+
#| user1_id | user2_id |
#+----------+----------+
#| 1        | 2        |
#| 2        | 4        |
#| 2        | 5        |
#+----------+----------+
#输出：
#+----------+----------+
#| user1_id | user2_id |
#+----------+----------+
#| 1        | 2        |
#+----------+----------+
#解释：
#用户 1 和 2 是朋友, 并且他们在同一天内都听了10、11、12的歌曲。所以，他们是兴趣相同的朋友。
#用户 1 和 3 在同一天内都听了10、11、12的歌曲，但他们不是朋友。
#用户 2 和 4 是朋友，但他们同一天内听过相同的歌曲的数量小于3。
#用户 2 和 5 是朋友，并且在都听了了10、11、12的歌曲，但不在同一天内。 
#
# Related Topics 数据库 👍 9 👎 0

public class LeetcodifySimilarFriends{
	public static void main(String[] args) {
		Solution solution = new LeetcodifySimilarFriends().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select distinct c.u1 user1_id,c.u2 user2_id from
-- (select a.day,a.user_id u1,b.user_id u2 from Listens a inner join Listens b
-- on a.day=b.day and a.song_id=b.song_id and a.user_id!=b.user_id
-- group by a.day,a.user_id,b.user_id having count(distinct a.song_id)>=3) c
-- where (c.u1,c.u2) in (select user1_id,user2_id from Friendship)

-- select distinct c.u1 user1_id,c.u2 user2_id from
-- (select a.day,a.user_id u1,b.user_id u2 from Listens a inner join Listens b
-- on a.day=b.day and a.song_id=b.song_id and a.user_id!=b.user_id
-- group by a.day,a.user_id,b.user_id having count(distinct a.song_id)>=3) c
-- left join Friendship d on c.u1=d.user1_id and c.u2=d.user2_id
-- where d.user1_id is not null and d.user2_id is not null

select distinct user1_id,user2_id
from Friendship f
         left join Listens l1
                   on user1_id=l1.user_id
         left join Listens l2
                   on user2_id=l2.user_id
where l1.song_id=l2.song_id
  and l1.day=l2.day
group by user1_id,user2_id,l1.day
having count(distinct l2.song_id)>=3

#leetcode submit region end(Prohibit modification and deletion)

}
