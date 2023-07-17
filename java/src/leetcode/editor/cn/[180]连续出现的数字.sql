package leetcode.editor.cn;

#表：Logs 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| id          | int     |
#| num         | varchar |
#+-------------+---------+
#id 是这个表的主键。 
#
# 
#
# 编写一个 SQL 查询，查找所有至少连续出现三次的数字。 
#
# 返回的结果表中的数据可以按 任意顺序 排列。 
#
# 查询结果格式如下面的例子所示： 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Logs 表：
#+----+-----+
#| Id | Num |
#+----+-----+
#| 1  | 1   |
#| 2  | 1   |
#| 3  | 1   |
#| 4  | 2   |
#| 5  | 1   |
#| 6  | 2   |
#| 7  | 2   |
#+----+-----+
#输出：
#Result 表：
#+-----------------+
#| ConsecutiveNums |
#+-----------------+
#| 1               |
#+-----------------+
#解释：1 是唯一连续出现至少三次的数字。 
#
# Related Topics 数据库 👍 760 👎 0

public class ConsecutiveNumbers{
	public static void main(String[] args) {
		Solution solution = new ConsecutiveNumbers().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below
-- select distinct c.Num ConsecutiveNums from
-- (select a.Num,@r:=if(@q=a.Num,@r+1,0) times,@q:=a.Num from Logs a,(select @r:=0,@q:=null) b) c where c.times>=2

-- select distinct a.Num ConsecutiveNums from Logs a,Logs b,Logs c where a.id=b.id-1 and b.id=c.id-1 and a.Num=b.Num and b.Num=c.Num

-- select distinct a.Num ConsecutiveNums from
-- (select Num,lag(Num,1) over(order by id) ln,lag(Num,2) over(order by id) ll from Logs) a where a.Num=a.ln and a.ln=a.ll

-- select distinct a.Num ConsecutiveNums from
-- (select Num,lag(Num,1) over(order by id) ln,lead(Num,1) over(order by id) ll from Logs) a where a.Num=a.ln and a.ln=a.ll

select distinct a.Num ConsecutiveNums from
(select Num,row_number() over(order by id) rn,row_number() over(partition by Num order by id) rn1 from Logs
    ) a group by a.Num,(a.rn-a.rn1) having count(*)>=3
#leetcode submit region end(Prohibit modification and deletion)

}
