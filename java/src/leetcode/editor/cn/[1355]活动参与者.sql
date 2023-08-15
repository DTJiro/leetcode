package leetcode.editor.cn;

#表: Friends 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| id            | int     |
#| name          | varchar |
#| activity      | varchar |
#+---------------+---------+
#id 是朋友的 id，并且在 SQL 中，是该表的主键
#name 是朋友的名字
#activity 是朋友参加的活动的名字
# 
#
# 
#
# 表: Activities 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| id            | int     |
#| name          | varchar |
#+---------------+---------+
#在 SQL 中，id 是该表的主键
#name 是活动的名字
# 
#
# 
#
# 找出那些既没有最多，也没有最少参与者的活动的名字。 
#
# Activities 表中的任意活动都有在 Friends 中参与过。 
#
# 可以以 任何顺序 返回结果。 
#
# 下面是返回结果格式的例子。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Friends 表:
#+------+--------------+---------------+
#| id   | name         | activity      |
#+------+--------------+---------------+
#| 1    | Jonathan D.  | Eating        |
#| 2    | Jade W.      | Singing       |
#| 3    | Victor J.    | Singing       |
#| 4    | Elvis Q.     | Eating        |
#| 5    | Daniel A.    | Eating        |
#| 6    | Bob B.       | Horse Riding  |
#+------+--------------+---------------+
#Activities 表:
#+------+--------------+
#| id   | name         |
#+------+--------------+
#| 1    | Eating       |
#| 2    | Singing      |
#| 3    | Horse Riding |
#+------+--------------+
#输出：
#+--------------+
#| activity     |
#+--------------+
#| Singing      |
#+--------------+
#解释：
#Eating 活动有三个人参加, 是最多人参加的活动 (Jonathan D. , Elvis Q. and Daniel A.)
#Horse Riding 活动有一个人参加, 是最少人参加的活动 (Bob B.)
#Singing 活动有两个人参加 (Victor J. and Jade W.) 
#
# Related Topics 数据库 👍 28 👎 0

public class ActivityParticipants{
	public static void main(String[] args) {
		Solution solution = new ActivityParticipants().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select activity from
-- (select activity,count(*) count from Friends group by activity) a
-- where count != (select min(count) from (select activity,count(*) count from Friends group by activity) b)
-- and count != (select max(count) from (select activity,count(*) count from Friends group by activity) c)

select activity from Friends group by activity
having count(*)>any(select count(*) from Friends group by activity)
and count(*)<any(select count(*) from Friends group by activity)

#leetcode submit region end(Prohibit modification and deletion)

}
