package leetcode.editor.cn;

#表: LogInfo
#
# 
#+-------------+----------+
#| Column Name | Type     |
#+-------------+----------+
#| account_id  | int      |
#| ip_address  | int      |
#| login       | datetime |
#| logout      | datetime |
#+-------------+----------+
#该表可能包含重复项。
#该表包含有关Leetflex帐户的登录和注销日期的信息。 它还包含了该账户用于登录和注销的网络地址的信息。
#题目确保每一个注销时间都在登录时间之后。
# 
#
# 
#
# 编写解决方案，查找那些应该被禁止的Leetflex帐户编号 account_id 。 如果某个帐户在某一时刻从两个不同的网络地址登录了，则这个帐户应该被禁止
#。 
#
# 可以以 任何顺序 返回结果。 
#
# 查询结果格式如下例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#LogInfo table:
#+------------+------------+---------------------+---------------------+
#| account_id | ip_address | login               | logout              |
#+------------+------------+---------------------+---------------------+
#| 1          | 1          | 2021-02-01 09:00:00 | 2021-02-01 09:30:00 |
#| 1          | 2          | 2021-02-01 08:00:00 | 2021-02-01 11:30:00 |
#| 2          | 6          | 2021-02-01 20:30:00 | 2021-02-01 22:00:00 |
#| 2          | 7          | 2021-02-02 20:30:00 | 2021-02-02 22:00:00 |
#| 3          | 9          | 2021-02-01 16:00:00 | 2021-02-01 16:59:59 |
#| 3          | 13         | 2021-02-01 17:00:00 | 2021-02-01 17:59:59 |
#| 4          | 10         | 2021-02-01 16:00:00 | 2021-02-01 17:00:00 |
#| 4          | 11         | 2021-02-01 17:00:00 | 2021-02-01 17:59:59 |
#+------------+------------+---------------------+---------------------+
#输出：
#+------------+
#| account_id |
#+------------+
#| 1          |
#| 4          |
#+------------+
#解释：
#Account ID 1 --> 该账户从 "2021-02-01 09:00:00" 到 "2021-02-01 09:30:00" 在两个不同的网络地址(
#1 and 2)上激活了。它应该被禁止.
#Account ID 2 --> 该账户在两个不同的网络地址 (6, 7) 激活了，但在不同的时间上.
#Account ID 3 --> 该账户在两个不同的网络地址 (9, 13) 激活了，虽然是同一天，但时间上没有交集.
#Account ID 4 --> 该账户从 "2021-02-01 17:00:00" 到 "2021-02-01 17:00:00" 在两个不同的网络地址 
#(10 and 11)上激活了。它应该被禁止. 
#
# Related Topics 数据库 👍 31 👎 0

public class LeetflexBannedAccounts{
	public static void main(String[] args) {
		Solution solution = new LeetflexBannedAccounts().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select distinct a.account_id from LogInfo a,LogInfo b
where a.account_id=b.account_id and a.ip_address!=b.ip_address
-- and (a.logout between b.login and b.logout or b.logout between a.login and a.logout)
and a.logout between b.login and b.logout

#leetcode submit region end(Prohibit modification and deletion)

}
