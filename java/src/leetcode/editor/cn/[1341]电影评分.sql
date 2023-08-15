package leetcode.editor.cn;

#表：Movies 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| movie_id      | int     |
#| title         | varchar |
#+---------------+---------+
#movie_id 是这个表的主键(具有唯一值的列)。
#title 是电影的名字。
# 
#
# 表：Users 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| user_id       | int     |
#| name          | varchar |
#+---------------+---------+
#user_id 是表的主键(具有唯一值的列)。
# 
#
# 表：MovieRating 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| movie_id      | int     |
#| user_id       | int     |
#| rating        | int     |
#| created_at    | date    |
#+---------------+---------+
#(movie_id, user_id) 是这个表的主键(具有唯一值的列的组合)。
#这个表包含用户在其评论中对电影的评分 rating 。
#created_at 是用户的点评日期。 
# 
#
# 
#
# 请你编写一个解决方案： 
#
# 
# 查找评论电影数量最多的用户名。如果出现平局，返回字典序较小的用户名。 
# 查找在 February 2020 平均评分最高 的电影名称。如果出现平局，返回字典序较小的电影名称。 
# 
#
# 字典序 ，即按字母在字典中出现顺序对字符串排序，字典序较小则意味着排序靠前。 
#
# 返回结果格式如下例所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Movies 表：
#+-------------+--------------+
#| movie_id    |  title       |
#+-------------+--------------+
#| 1           | Avengers     |
#| 2           | Frozen 2     |
#| 3           | Joker        |
#+-------------+--------------+
#Users 表：
#+-------------+--------------+
#| user_id     |  name        |
#+-------------+--------------+
#| 1           | Daniel       |
#| 2           | Monica       |
#| 3           | Maria        |
#| 4           | James        |
#+-------------+--------------+
#MovieRating 表：
#+-------------+--------------+--------------+-------------+
#| movie_id    | user_id      | rating       | created_at  |
#+-------------+--------------+--------------+-------------+
#| 1           | 1            | 3            | 2020-01-12  |
#| 1           | 2            | 4            | 2020-02-11  |
#| 1           | 3            | 2            | 2020-02-12  |
#| 1           | 4            | 1            | 2020-01-01  |
#| 2           | 1            | 5            | 2020-02-17  | 
#| 2           | 2            | 2            | 2020-02-01  | 
#| 2           | 3            | 2            | 2020-03-01  |
#| 3           | 1            | 3            | 2020-02-22  | 
#| 3           | 2            | 4            | 2020-02-25  | 
#+-------------+--------------+--------------+-------------+
#输出：
#Result 表：
#+--------------+
#| results      |
#+--------------+
#| Daniel       |
#| Frozen 2     |
#+--------------+
#解释：
#Daniel 和 Monica 都点评了 3 部电影（"Avengers", "Frozen 2" 和 "Joker"） 但是 Daniel 字典序比较小。
#Frozen 2 和 Joker 在 2 月的评分都是 3.5，但是 Frozen 2 的字典序比较小。
# 
#
# Related Topics 数据库 👍 45 👎 0

public class MovieRating{
	public static void main(String[] args) {
		Solution solution = new MovieRating().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select * from (select a.name results from Users a inner join (select user_id,count(movie_id) count from MovieRating group by user_id) b
on a.user_id=b.user_id order by count desc,name limit 1) a
union all
select * from (select title results from (select movie_id,avg(rating) rating from MovieRating where created_at like '2020-02%' group by movie_id) a
inner join Movies b on a.movie_id=b.movie_id order by rating desc,title limit 1) a

#leetcode submit region end(Prohibit modification and deletion)

}
