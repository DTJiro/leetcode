package leetcode.editor.cn;

#表：Sessions 
#
# +---------------------+---------+
#| Column Name         | Type    |
#+---------------------+---------+
#| session_id          | int     |
#| duration            | int     |
#+---------------------+---------+
#session_id 是该表主键
#duration 是用户访问应用的时间, 以秒为单位
# 
#
# 
#
# 你想知道用户在你的 app 上的访问时长情况。因此决定统计访问时长区间分别为 "[0-5>", "[5-10>", "[10-15>" 和 "15 or 
#more" （单位：分钟）的会话数量，并以此绘制柱状图。 
#
# 写一个SQL查询来报告（访问时长区间，会话总数）。结果可用任何顺序呈现。 
#
# 
#
# 下方为查询的输出格式： 
#
# Sessions 表：
#+-------------+---------------+
#| session_id  | duration      |
#+-------------+---------------+
#| 1           | 30            |
#| 2           | 199           |
#| 3           | 299           |
#| 4           | 580           |
#| 5           | 1000          |
#+-------------+---------------+
#
#Result 表：
#+--------------+--------------+
#| bin          | total        |
#+--------------+--------------+
#| [0-5>        | 3            |
#| [5-10>       | 1            |
#| [10-15>      | 0            |
#| 15 or more   | 1            |
#+--------------+--------------+
#
#对于 session_id 1，2 和 3 ，它们的访问时间大于等于 0 分钟且小于 5 分钟。
#对于 session_id 4，它的访问时间大于等于 5 分钟且小于 10 分钟。
#没有会话的访问时间大于等于 10 分钟且小于 15 分钟。
#对于 session_id 5, 它的访问时间大于等于 15 分钟。
# 
#
# Related Topics 数据库 👍 38 👎 0

public class CreateASessionBarChart{
	public static void main(String[] args) {
		Solution solution = new CreateASessionBarChart().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select a.bin,ifnull(count(b.session_id),0) total from
-- (select '[0-5>' bin union select '[5-10>' bin union select '[10-15>' bin union select '15 or more' bin
-- ) a left join (select *,
-- case when duration/60<5 then '[0-5>'
--     when duration/60>=5 and duration/60<10 then '[5-10>'
--     when duration/60>=10 and duration/60<15 then '[10-15>'
--     else '15 or more' end bin
-- from Sessions) b on a.bin=b.bin group by a.bin

select '[0-5>' bin, sum(if(duration<300,1,0)) TOTAL from Sessions
union
select '[5-10>', sum(if(300<=duration and duration<600,1,0))  from Sessions
union
select '[10-15>', sum(if(600<=duration and duration<900,1,0))  from Sessions
union
select '15 or more', sum(if(900<=duration,1,0))  from Sessions


#leetcode submit region end(Prohibit modification and deletion)

}
