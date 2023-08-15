package leetcode.editor.cn;

#表: UserActivity 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| username      | varchar |
#| activity      | varchar |
#| startDate     | Date    |
#| endDate       | Date    |
#+---------------+---------+
#该表可能有重复的行
#该表包含每个用户在一段时间内进行的活动的信息
#名为 username 的用户在 startDate 到 endDate 日内有一次活动
# 
#
# 
#
# 编写解决方案展示每一位用户 最近第二次 的活动 
#
# 如果用户仅有一次活动，返回该活动 
#
# 一个用户不能同时进行超过一项活动，以 任意 顺序返回结果 
#
# 下面是返回结果格式的例子。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#UserActivity 表:
#+------------+--------------+-------------+-------------+
#| username   | activity     | startDate   | endDate     |
#+------------+--------------+-------------+-------------+
#| Alice      | Travel       | 2020-02-12  | 2020-02-20  |
#| Alice      | Dancing      | 2020-02-21  | 2020-02-23  |
#| Alice      | Travel       | 2020-02-24  | 2020-02-28  |
#| Bob        | Travel       | 2020-02-11  | 2020-02-18  |
#+------------+--------------+-------------+-------------+
#输出：
#+------------+--------------+-------------+-------------+
#| username   | activity     | startDate   | endDate     |
#+------------+--------------+-------------+-------------+
#| Alice      | Dancing      | 2020-02-21  | 2020-02-23  |
#| Bob        | Travel       | 2020-02-11  | 2020-02-18  |
#+------------+--------------+-------------+-------------+
#解释：
#Alice 最近一次的活动是从 2020-02-24 到 2020-02-28 的旅行, 在此之前的 2020-02-21 到 2020-02-23 她进行了
#舞蹈
#Bob 只有一条记录，我们就取这条记录 
#
# Related Topics 数据库 👍 21 👎 0

public class GetTheSecondMostRecentActivity{
	public static void main(String[] args) {
		Solution solution = new GetTheSecondMostRecentActivity().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select b.username,b.activity,b.startDate,b.endDate from
-- (select username,if(count(*)>=2,2,1) count from UserActivity group by username) a
-- left join (select *,row_number() over(partition by username order by startDate desc) rn from UserActivity) b
-- on a.username=b.username and a.count=b.rn

-- select username, activity, startDate, endDate
-- from (
--          select
--              username,
--              activity,
--              startDate,
--              endDate,
--              rank() over (partition by username order by endDate desc) rk
--          from UserActivity
--      ) tmp where rk = 2
-- union
-- select username, activity, startDate, endDate
-- from UserActivity
-- group by username having count(*) = 1;

/* Write your T-SQL query statement below */

SELECT u1.username,u1.activity,u1.startDate,u1.endDate
from(
        SELECT *,
               rank() over(partition by username order by startDate desc ) as 'rank1',
                COUNT(*)over(partition by username  ) as 'count1'
        FROM UserActivity) as u1
WHERE rank1 = 2
   or count1 =1

#leetcode submit region end(Prohibit modification and deletion)

}
