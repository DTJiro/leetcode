package leetcode.editor.cn;

#表： NewYork 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| student_id  | int  |
#| score       | int  |
#+-------------+------+
#在 SQL 中，student_id 是这个表的主键。
#每一行包含纽约大学 (New York University) 中一名学生一次考试的成绩。
# 
#
# 
#
# 表： California 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| student_id  | int  |
#| score       | int  |
#+-------------+------+
#在 SQL 中，student_id 是这个表的主键。
#每一行包含加州大学 (California University) 中一名学生一次考试的成绩。
# 
#
# 
#
# 纽约大学和加州大学之间举行了一场比赛。这场比赛由两所大学中相同数量的学生参加。拥有更多优秀学生的大学赢得这场比赛。如果两所大学的优秀学生数量相同，则这场比赛
#平局。 
#
# 优秀学生是指在考试中获得 90% 或更高成绩的学生。 
#
# 返回： 
#
# 
# "New York University" 若纽约大学赢得这场比赛。 
# "California University" 若加州大学赢得这场比赛。 
# "No Winner" 若这场比赛平局。 
# 
#
# 返回结果格式如下示例所示： 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#NewYork 表:
#+------------+-------+
#| student_id | score |
#+------------+-------+
#| 1          | 90    |
#| 2          | 87    |
#+------------+-------+
#California 表:
#+------------+-------+
#| student_id | score |
#+------------+-------+
#| 2          | 89    |
#| 3          | 88    |
#+------------+-------+
#输出: 
#+---------------------+
#| winner              |
#+---------------------+
#| New York University |
#+---------------------+
#解释:
#纽约大学有 1 名优秀学生，加州大学有 0 名优秀学生。
# 
#
# 示例 2: 
#
# 
#输入: 
#NewYork 表:
#+------------+-------+
#| student_id | score |
#+------------+-------+
#| 1          | 89    |
#| 2          | 88    |
#+------------+-------+
#California 表:
#+------------+-------+
#| student_id | score |
#+------------+-------+
#| 2          | 90    |
#| 3          | 87    |
#+------------+-------+
#输出: 
#+-----------------------+
#| winner                |
#+-----------------------+
#| California University |
#+-----------------------+
#解释:
#纽约大学有 0 名优秀学生，加州大学有 1 名优秀学生。
# 
#
# 示例 3: 
#
# 
#输入: 
#NewYork 表:
#+------------+-------+
#| student_id | score |
#+------------+-------+
#| 1          | 89    |
#| 2          | 90    |
#+------------+-------+
#California 表:
#+------------+-------+
#| student_id | score |
#+------------+-------+
#| 2          | 87    |
#| 3          | 99    |
#+------------+-------+
#输出: 
#+-----------+
#| winner    |
#+-----------+
#| No Winner |
#+-----------+
#解释:
#纽约大学和加州大学均有 1 名优秀学生。
# 
#
# Related Topics 数据库 👍 10 👎 0

public class TheWinnerUniversity{
	public static void main(String[] args) {
		Solution solution = new TheWinnerUniversity().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select case when a.c>b.c then 'New York University'
            when a.c<b.c then 'California University'
else 'No Winner' end winner
from
(select count(student_id) c from NewYork where score>=90) a,
(select count(student_id) c from California where score>=90) b

#leetcode submit region end(Prohibit modification and deletion)

}
