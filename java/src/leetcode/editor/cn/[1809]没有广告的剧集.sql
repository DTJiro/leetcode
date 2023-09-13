package leetcode.editor.cn;

#表：Playback 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| session_id  | int  |
#| customer_id | int  |
#| start_time  | int  |
#| end_time    | int  |
#+-------------+------+
#session_id 是该表中具有唯一值的列。
#customer_id 是观看该剧集的客户的 id。
#剧集播放时间包含start_time（开始时间） 及 end_time（结束时间）
#可以保证的是，start_time（开始时间）<= end_time（结束时间），一个观众观看的两个剧集的时间不会出现重叠。 
#
# 
#
# 表：Ads 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| ad_id       | int  |
#| customer_id | int  |
#| timestamp   | int  |
#+-------------+------+
#ad_id 是该表中具有唯一值的列。
#customer_id 为 观看广告的用户 id
#timestamp 表示广告出现的时间点
# 
#
# 
#
# 编写解决方案找出所有没有广告出现过的剧集。 
#
# 返回结果 无顺序要求 。 
#
# 返回结果格式如下例所示： 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Playback table:
#+------------+-------------+------------+----------+
#| session_id | customer_id | start_time | end_time |
#+------------+-------------+------------+----------+
#| 1          | 1           | 1          | 5        |
#| 2          | 1           | 15         | 23       |
#| 3          | 2           | 10         | 12       |
#| 4          | 2           | 17         | 28       |
#| 5          | 2           | 2          | 8        |
#+------------+-------------+------------+----------+
#Ads table:
#+-------+-------------+-----------+
#| ad_id | customer_id | timestamp |
#+-------+-------------+-----------+
#| 1     | 1           | 5         |
#| 2     | 2           | 17        |
#| 3     | 2           | 20        |
#+-------+-------------+-----------+
#输出：
#+------------+
#| session_id |
#+------------+
#| 2          |
#| 3          |
#| 5          |
#+------------+
#解释：
#广告1出现在了剧集1的时间段，被观众1看到了。
#广告2出现在了剧集4的时间段，被观众2看到了。
#广告3出现在了剧集4的时间段，被观众2看到了。
#我们可以得出结论，剧集1 、4 内，起码有1处广告。 剧集2 、3 、5 没有广告。 
#
# Related Topics 数据库 👍 13 👎 0

public class AdFreeSessions{
	public static void main(String[] args) {
		Solution solution = new AdFreeSessions().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select distinct a.session_id from Playback a left join Ads b
-- on a.customer_id=b.customer_id and b.timestamp between a.start_time and a.end_time
-- where b.ad_id is null

select session_id from Playback where session_id not in
( select session_id from Playback p join ads a where p.customer_id=a.customer_id and timestamp between start_time and end_time )

#leetcode submit region end(Prohibit modification and deletion)

}
