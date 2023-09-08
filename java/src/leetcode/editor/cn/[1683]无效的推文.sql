package leetcode.editor.cn;

#表：Tweets 
#
# 
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| tweet_id       | int     |
#| content        | varchar |
#+----------------+---------+
#在 SQL 中，tweet_id 是这个表的主键。
#这个表包含某社交媒体 App 中所有的推文。 
#
# 
#
# 查询所有无效推文的编号（ID）。当推文内容中的字符数严格大于 15 时，该推文是无效的。 
#
# 以任意顺序返回结果表。 
#
# 查询结果格式如下所示： 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Tweets 表：
#+----------+----------------------------------+
#| tweet_id | content                          |
#+----------+----------------------------------+
#| 1        | Vote for Biden                   |
#| 2        | Let us make America great again! |
#+----------+----------------------------------+
#
#输出：
#+----------+
#| tweet_id |
#+----------+
#| 2        |
#+----------+
#解释：
#推文 1 的长度 length = 14。该推文是有效的。
#推文 2 的长度 length = 32。该推文是无效的。
# 
#
# Related Topics 数据库 👍 39 👎 0

public class InvalidTweets{
	public static void main(String[] args) {
		Solution solution = new InvalidTweets().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select tweet_id from Tweets where length(content)>15

#leetcode submit region end(Prohibit modification and deletion)

}
