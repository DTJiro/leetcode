package leetcode.editor.cn;

#表： Listens 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| user_id     | int     |
#| song_id     | int     |
#| day         | date    |
#+-------------+---------+
#这个表没有主键，可能存在重复项。
#表中的每一行表示用户 user_id 在 day 这一天收听的歌曲 song_id。
# 
#
# 
#
# 表： Friendship 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| user1_id      | int     |
#| user2_id      | int     |
#+---------------+---------+
#(user1_id, user2_id) 是这个表的主键。
#表中的每一行表示 user1_id 和 user2_id 是好友。
#注意，user1_id < user2_id。
# 
#
# 
#
# 写出 SQL 语句，为 Leetcodify 用户推荐好友。我们将符合下列条件的用户 x 推荐给用户 y ： 
#
# 
# 用户 x 和 y 不是好友，且 
# 用户 x 和 y 在同一天收听了相同的三首或更多不同歌曲。 
# 
#
# 注意，好友推荐是单向的，这意味着如果用户 x 和用户 y 需要互相推荐给对方，结果表需要将用户 x 推荐给用户 y 并将用户 y 推荐给用户 x。另外，结果
#表不得出现重复项（即，用户 y 不可多次推荐给用户 x ）。 
#
# 按任意顺序返回结果表。 
#
# 查询格式如下示例所示： 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Listens 表：
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
#Friendship 表：
#+----------+----------+
#| user1_id | user2_id |
#+----------+----------+
#| 1        | 2        |
#+----------+----------+
#输出：
#+---------+----------------+
#| user_id | recommended_id |
#+---------+----------------+
#| 1       | 3              |
#| 2       | 3              |
#| 3       | 1              |
#| 3       | 2              |
#+---------+----------------+
#解释
#用户 1 和 2 在同一天收听了歌曲 10、11 和 12，但他们已经是好友了。
#用户 1 和 3 在同一天收听了歌曲 10、11 和 12。由于他们不是好友，所以我们给他们互相推荐为好友。
#用户 1 和 4 没有收听三首相同的歌曲。
#用户 1 和 5 收听了歌曲 10、11 和 12，但不是在同一天收听的。
#
#类似地，我们可以发现用户 2 和 3 在同一天收听了歌曲 10、11 和 12，且他们不是好友，所以我们给他们互相推荐为好友。
# 
#
# Related Topics 数据库 👍 11 👎 0

public class LeetcodifyFriendsRecommendations{
	public static void main(String[] args) {
		Solution solution = new LeetcodifyFriendsRecommendations().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select distinct c.u1 user_id,c.u2 recommended_id from
-- (select a.day,a.user_id u1,b.user_id u2 from Listens a inner join Listens b
-- on a.day=b.day and a.song_id=b.song_id and a.user_id!=b.user_id
-- group by a.day,a.user_id,b.user_id having count(distinct a.song_id)>=3) c
-- left join Friendship d on (c.u1=d.user1_id and c.u2=d.user2_id) or (c.u2=d.user1_id and c.u1=d.user2_id)
-- where d.user1_id is null or d.user2_id is null

SELECT DISTINCT user_id, recommended_id
FROM
    (SELECT user_id, recommended_id, day, COUNT(song_id)
     FROM
         (SELECT a.user_id AS user_id, b.user_id AS recommended_id, a.song_id, a.day
         FROM (SELECT DISTINCT * FROM Listens) a
         INNER JOIN (SELECT DISTINCT * FROM Listens) b
         ON a.song_id = b.song_id AND a.day = b.day AND a.user_id != b.user_id) c
     GROUP BY user_id, recommended_id, day
     HAVING COUNT(song_id) >= 3) e
        LEFT JOIN (SELECT user1_id u1, user2_id u2 FROM Friendship UNION ALL SELECT user2_id u1, user1_id u2 FROM Friendship) f
                  ON e.user_id = f.u1 AND e.recommended_id = f.u2
WHERE u1 is NULL AND u2 is NULL

#leetcode submit region end(Prohibit modification and deletion)

}
