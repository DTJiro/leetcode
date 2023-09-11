package leetcode.editor.cn;

#表： UserVisits 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| user_id     | int  |
#| visit_date  | date |
#+-------------+------+
#该表没有主键，它可能有重复的行
#该表包含用户访问某特定零售商的日期日志。 
#
# 
#
# 假设今天的日期是 '2021-1-1' 。 
#
# 编写解决方案，对于每个 user_id ，求出每次访问及其下一个访问（若该次访问是最后一次，则为今天）之间最大的空档期天数 window 。 
#
# 返回结果表，按用户编号 user_id 排序。 
#
# 结果格式如下示例所示： 
#
# 
#
# 示例 1： 
#
# 
#输入：
#UserVisits 表：
#+---------+------------+
#| user_id | visit_date |
#+---------+------------+
#| 1       | 2020-11-28 |
#| 1       | 2020-10-20 |
#| 1       | 2020-12-3  |
#| 2       | 2020-10-5  |
#| 2       | 2020-12-9  |
#| 3       | 2020-11-11 |
#+---------+------------+
#输出：
#+---------+---------------+
#| user_id | biggest_window|
#+---------+---------------+
#| 1       | 39            |
#| 2       | 65            |
#| 3       | 51            |
#+---------+---------------+
#解释：
#对于第一个用户，问题中的空档期在以下日期之间：
#    - 2020-10-20 至 2020-11-28 ，共计 39 天。
#    - 2020-11-28 至 2020-12-3 ，共计 5 天。
#    - 2020-12-3 至 2021-1-1 ，共计 29 天。
#由此得出，最大的空档期为 39 天。
#对于第二个用户，问题中的空档期在以下日期之间：
#    - 2020-10-5 至 2020-12-9 ，共计 65 天。
#    - 2020-12-9 至 2021-1-1 ，共计 23 天。
#由此得出，最大的空档期为 65 天。
#对于第三个用户，问题中的唯一空档期在 2020-11-11 至 2021-1-1 之间，共计 51 天。 
#
# Related Topics 数据库 👍 36 👎 0

public class BiggestWindowBetweenVisits{
	public static void main(String[] args) {
		Solution solution = new BiggestWindowBetweenVisits().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select a.user_id,max(datediff(ifnull(b.visit_date,'2021-1-1'),a.visit_date)) biggest_window from
-- (select *,row_number() over(partition by user_id order by visit_date) rn from UserVisits) a left join
-- (select *,row_number() over(partition by user_id order by visit_date) rn from UserVisits) b
-- on a.user_id=b.user_id and a.rn=b.rn-1
-- group by a.user_id

-- with t as (
--     select user_id,visit_date,lead(visit_date,1,'2021-01-01') over(partition by user_id order by visit_date) ld from UserVisits
-- )
-- select user_id,max(df) as biggest_window from (
--   select user_id,datediff(ld,visit_date) as df from t
-- ) tmp group by user_id

SELECT
    user_id,
    MAX(DATEDIFF(next_day, visit_date)) AS biggest_window
FROM (
         SELECT
             user_id,
             visit_date,
             LEAD(visit_date, 1, '2021-1-1') OVER (PARTITION BY user_id ORDER BY visit_date) AS next_day
         FROM UserVisits
     ) tmp
GROUP BY user_id
ORDER BY user_id

#leetcode submit region end(Prohibit modification and deletion)

}
