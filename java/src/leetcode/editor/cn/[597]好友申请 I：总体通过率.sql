package leetcode.editor.cn;

#表：FriendRequest 
#
# 
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| sender_id      | int     |
#| send_to_id     | int     |
#| request_date   | date    |
#+----------------+---------+
#此表没有主键，它可能包含重复项。
#该表包含发送请求的用户的 ID ，接受请求的用户的 ID 以及请求的日期。
# 
#
# 
#
# 表：RequestAccepted 
#
# 
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| requester_id   | int     |
#| accepter_id    | int     |
#| accept_date    | date    |
#+----------------+---------+
#此表没有主键，它可能包含重复项。
#该表包含发送请求的用户的 ID ，接受请求的用户的 ID 以及请求通过的日期。 
#
# 
#
# 写一个查询语句，求出好友申请的通过率，用 2 位小数表示。通过率由接受好友申请的数目除以申请总数。 
#
# 提示： 
#
# 
# 通过的好友申请不一定都在表 friend_request 中。你只需要统计总的被通过的申请数（不管它们在不在表 FriendRequest 中），并将它除以
#申请总数，得到通过率 
# 一个好友申请发送者有可能会给接受者发几条好友申请，也有可能一个好友申请会被通过好几次。这种情况下，重复的好友申请只统计一次。 
# 如果一个好友申请都没有，你应该返回 accept_rate 为 0.00 。 
# 
#
# 查询结果应该如下例所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#FriendRequest 表：
#+-----------+------------+--------------+
#| sender_id | send_to_id | request_date |
#+-----------+------------+--------------+
#| 1         | 2          | 2016/06/01   |
#| 1         | 3          | 2016/06/01   |
#| 1         | 4          | 2016/06/01   |
#| 2         | 3          | 2016/06/02   |
#| 3         | 4          | 2016/06/09   |
#+-----------+------------+--------------+
#RequestAccepted 表：
#+--------------+-------------+-------------+
#| requester_id | accepter_id | accept_date |
#+--------------+-------------+-------------+
#| 1            | 2           | 2016/06/03  |
#| 1            | 3           | 2016/06/08  |
#| 2            | 3           | 2016/06/08  |
#| 3            | 4           | 2016/06/09  |
#| 3            | 4           | 2016/06/10  |
#+--------------+-------------+-------------+
#输出：
#+-------------+
#| accept_rate |
#+-------------+
#| 0.8         |
#+-------------+
#解释：
#总共有 5 个请求，有 4 个不同的通过请求，所以通过率是 0.80 
#
# 
#
# 进阶: 
#
# 
# 你能写一个查询语句得到每个月的通过率吗？ 
# 你能求出每一天的累计通过率吗？ 
# 
#
# Related Topics 数据库 👍 97 👎 0

public class FriendRequestsIOverallAcceptanceRate{
	public static void main(String[] args) {
		Solution solution = new FriendRequestsIOverallAcceptanceRate().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select round(if(a.total=0,0,b.count/a.total),2) accept_rate from
-- (select ifnull(count(*),0) total from (select distinct sender_id,send_to_id from FriendRequest) c) a,
-- (select count(*) count from (select distinct requester_id,accepter_id from RequestAccepted) d) b

select
    round(
            ifnull(
                        (select count(*) from (select distinct requester_id, accepter_id from RequestAccepted) as A)
                        /
                        (select count(*) from (select distinct sender_id, send_to_id from FriendRequest) as B),
                        0)
        , 2) as accept_rate;


#leetcode submit region end(Prohibit modification and deletion)

}
