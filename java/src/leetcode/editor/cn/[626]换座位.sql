package leetcode.editor.cn;

#表: Seat 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| id          | int     |
#| name        | varchar |
#+-------------+---------+
#Id是该表的主键列。
#该表的每一行都表示学生的姓名和ID。
#Id是一个连续的增量。
# 
#
# 
#
# 编写SQL查询来交换每两个连续的学生的座位号。如果学生的数量是奇数，则最后一个学生的id不交换。 
#
# 按 id 升序 返回结果表。 
#
# 查询结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Seat 表:
#+----+---------+
#| id | student |
#+----+---------+
#| 1  | Abbot   |
#| 2  | Doris   |
#| 3  | Emerson |
#| 4  | Green   |
#| 5  | Jeames  |
#+----+---------+
#输出: 
#+----+---------+
#| id | student |
#+----+---------+
#| 1  | Doris   |
#| 2  | Abbot   |
#| 3  | Green   |
#| 4  | Emerson |
#| 5  | Jeames  |
#+----+---------+
#解释:
#请注意，如果学生人数为奇数，则不需要更换最后一名学生的座位。 
#
# Related Topics 数据库 👍 386 👎 0

public class ExchangeSeats{
	public static void main(String[] args) {
		Solution solution = new ExchangeSeats().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select
case when a.id%2=1 and a.id != b.count then a.id+1
when a.id%2=1 and a.id=b.count then a.id else a.id-1 end id,a.student
from Seat a,(select count(*) count from Seat) b order by id

#leetcode submit region end(Prohibit modification and deletion)

}
