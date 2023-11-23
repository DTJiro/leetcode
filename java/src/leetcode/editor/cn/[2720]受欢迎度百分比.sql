package leetcode.editor.cn;

#表：Friends 
#
# 
#+-------------+------+
#| 列名        | 类型  |
#+-------------+------+
#| user1       | int  |
#| user2       | int  |
#+-------------+------+
#(user1, user2) 是该表的主键。 
#每一行包含关于用户1和用户2是朋友的信息。 
# 
#
# 编写一条 SQL 查询，找出 Meta/Facebook 平台上每个用户的受欢迎度的百分比。受欢迎度百分比定义为用户拥有的朋友总数除以平台上的总用户数，然后
#乘以 100，并 四舍五入保留 2 位小数 。 
#
# 返回按照 user1 升序 排序的结果表。 
#
# 查询结果的格式如下所示。 
#
# 
#
# 示例 1： 
#
# 
#输入： 
#Friends 表:
#+-------+-------+
#| user1 | user2 | 
#+-------+-------+
#| 2     | 1     | 
#| 1     | 3     | 
#| 4     | 1     | 
#| 1     | 5     | 
#| 1     | 6     |
#| 2     | 6     | 
#| 7     | 2     | 
#| 8     | 3     | 
#| 3     | 9     |  
#+-------+-------+
#输出：
#+-------+-----------------------+
#| user1 | percentage_popularity |
#+-------+-----------------------+
#| 1     | 55.56                 |
#| 2     | 33.33                 |
#| 3     | 33.33                 |
#| 4     | 11.11                 |
#| 5     | 11.11                 |
#| 6     | 22.22                 |
#| 7     | 11.11                 |
#| 8     | 11.11                 |
#| 9     | 11.11                 |
#+-------+-----------------------+
#解释：
#平台上总共有 9 个用户。
#- 用户 "1" 与 2、3、4、5 和 6 是朋友。因此，用户 1 的受欢迎度百分比计算为（5/9）* 100 = 55.56。
#- 用户 "2" 与 1、6 和 7 是朋友。因此，用户 2 的受欢迎度百分比计算为（3/9）* 100 = 33.33。
#- 用户 "3" 与 1、8 和 9 是朋友。因此，用户 3 的受欢迎度百分比计算为（3/9）* 100 = 33.33。
#- 用户 "4" 与 1 是朋友。因此，用户 4 的受欢迎度百分比计算为（1/9）* 100 = 11.11。
#- 用户 "5" 与 1 是朋友。因此，用户 5 的受欢迎度百分比计算为（1/9）* 100 = 11.11。
#- 用户 "6" 与 1 和 2 是朋友。因此，用户 6 的受欢迎度百分比计算为（2/9）* 100 = 22.22。
#- 用户 "7" 与 2 是朋友。因此，用户 7 的受欢迎度百分比计算为（1/9）* 100 = 11.11。
#- 用户 "8" 与 3 是朋友。因此，用户 8 的受欢迎度百分比计算为（1/9）* 100 = 11.11。
#- 用户 "9" 与 3 是朋友。因此，用户 9 的受欢迎度百分比计算为（1/9）* 100 = 11.11。 
#user1 按升序排序。 
#
# Related Topics 数据库 👍 0 👎 0

public class PopularityPercentage{
	public static void main(String[] args) {
		Solution solution = new PopularityPercentage().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select user1,round(count/total*100,2) percentage_popularity from
(select user1,count(distinct user2) count from
(select user1,user2 from Friends
union all
select user2,user1 from Friends) a
group by user1) b,(select count(distinct user1) total from
(select user1 from Friends union all select user2 from Friends) c
) d order by user1

#leetcode submit region end(Prohibit modification and deletion)

}
