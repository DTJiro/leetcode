package leetcode.editor.cn;

#表： Friendship 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| user1_id      | int     |
#| user2_id      | int     |
#+---------------+---------+
#(user1_id,user2_id) 是 Friendship 表的主键(具有唯一值的列的组合)。
#该表的每一行表示用户user1_id和user2_id是好友。
# 
#
# 
#
# 表： Likes 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| user_id     | int     |
#| page_id     | int     |
#+-------------+---------+
#(user_id,page_id) 是 Likes 表的主键(具有唯一值的列)。
#该表的每一行表示user_id喜欢page_id。
# 
#
# 
#
# 您正在为一个社交媒体网站实施一个页面推荐系统。如果页面被user_id的 至少一个朋友喜欢 ，而 不被user_id喜欢 ，你的系统将 推荐 一个页面到
#user_id。 
#
# 编写一个解决方案来查找针对每个用户的所有可能的 页面建议 。每个建议应该在结果表中显示为一行，包含以下列: 
#
# 
# user_id: 系统向其提出建议的用户的ID。 
# page_id: 推荐为 user_id 的页面ID。. 
# friends_likes: user_id 对应 page_id 的好友数。 
# 
#
# 以 任意顺序 返回结果表。 
#
# 返回结果格式示例如下。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Friendship 表:
#+----------+----------+
#| user1_id | user2_id |
#+----------+----------+
#| 1        | 2        |
#| 1        | 3        |
#| 1        | 4        |
#| 2        | 3        |
#| 2        | 4        |
#| 2        | 5        |
#| 6        | 1        |
#+----------+----------+
#Likes 表:
#+---------+---------+
#| user_id | page_id |
#+---------+---------+
#| 1       | 88      |
#| 2       | 23      |
#| 3       | 24      |
#| 4       | 56      |
#| 5       | 11      |
#| 6       | 33      |
#| 2       | 77      |
#| 3       | 77      |
#| 6       | 88      |
#+---------+---------+
#输出：
#+---------+---------+---------------+
#| user_id | page_id | friends_likes |
#+---------+---------+---------------+
#| 1       | 77      | 2             |
#| 1       | 23      | 1             |
#| 1       | 24      | 1             |
#| 1       | 56      | 1             |
#| 1       | 33      | 1             |
#| 2       | 24      | 1             |
#| 2       | 56      | 1             |
#| 2       | 11      | 1             |
#| 2       | 88      | 1             |
#| 3       | 88      | 1             |
#| 3       | 23      | 1             |
#| 4       | 88      | 1             |
#| 4       | 77      | 1             |
#| 4       | 23      | 1             |
#| 5       | 77      | 1             |
#| 5       | 23      | 1             |
#+---------+---------+---------------+
#解释：
#以用户1为例:
#—用户1是用户2、3、4、6的好友。
#-推荐页面有23(用户2喜欢)，24(用户3喜欢)，56(用户3喜欢)，33(用户6喜欢)，77(用户2和用户3喜欢)。
#-请注意，第88页不推荐，因为用户1已经喜欢它。
#
#另一个例子是用户6:
#—用户6是用户1的好友。
#-用户1只喜欢了88页，但用户6已经喜欢了。因此，用户6没有推荐。
#
#您可以使用类似的过程为用户2、3、4和5推荐页面。 
#
# Related Topics 数据库 👍 15 👎 0

public class PageRecommendationsIi{
	public static void main(String[] args) {
		Solution solution = new PageRecommendationsIi().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- SELECT
--     a.user1_id user_id,
--     b.page_id,
--     count( b.page_id ) friends_likes
-- FROM
--     ( SELECT user1_id, user2_id FROM Friendship UNION ALL SELECT user2_id user1_id, user1_id user2_id FROM Friendship ) a
--         LEFT JOIN Likes b ON a.user2_id = b.user_id
-- WHERE
--     NOT EXISTS (
--             SELECT
--                 user_id,
--                 page_id
--             FROM
--                 Likes
--             where user_id=a.user1_id and page_id=b.page_id
--         )
-- GROUP BY
--     a.user1_id,
--     b.page_id

SELECT
    a.user2_id user_id,
    b.page_id,
    count( b.page_id ) friends_likes
FROM
    ( SELECT user1_id, user2_id FROM Friendship UNION ALL SELECT user2_id user1_id, user1_id user2_id FROM Friendship ) a
        LEFT JOIN Likes b ON a.user1_id = b.user_id
        LEFT JOIN Likes c ON a.user2_id = c.user_id
        AND c.page_id = b.page_id
WHERE
    c.user_id IS NULL
GROUP BY
    a.user2_id,
    b.page_id

#leetcode submit region end(Prohibit modification and deletion)

}
