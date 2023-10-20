package leetcode.editor.cn;

#表: Students 
#
# 
#+---------------+------+
#| Column Name   | Type |
#+---------------+------+
#| student_id    | int  |
#| department_id | int  |
#| mark          | int  |
#+---------------+------+
#student_id 包含唯一值。
#该表的每一行都表示一个学生的 ID，该学生就读的院系 ID，以及他们的考试分数。
# 
#
# 
#
# 编写一个解决方案，以百分比的形式报告每个学生在其部门的排名，其中排名的百分比使用以下公式计算: 
#
# (student_rank_in_the_department - 1) * 100 / (the_number_of_students_in_the_
#department - 1)。 percentage 应该 四舍五入到小数点后两位。 
#
# student_rank_in_the_department 由 mark 的降序决定，mark 最高的学生是 rank 1。如果两个学生得到相同的分数，他
#们也会得到相同的排名。 
#
# 以 任意顺序 返回结果表。 
#
# 结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Students 表:
#+------------+---------------+------+
#| student_id | department_id | mark |
#+------------+---------------+------+
#| 2          | 2             | 650  |
#| 8          | 2             | 650  |
#| 7          | 1             | 920  |
#| 1          | 1             | 610  |
#| 3          | 1             | 530  |
#+------------+---------------+------+
#输出: 
#+------------+---------------+------------+
#| student_id | department_id | percentage |
#+------------+---------------+------------+
#| 7          | 1             | 0.0        |
#| 1          | 1             | 50.0       |
#| 3          | 1             | 100.0      |
#| 2          | 2             | 0.0        |
#| 8          | 2             | 0.0        |
#+------------+---------------+------------+
#解释: 
#对于院系 1:
# - 学生 7:percentage = (1 - 1)* 100 / (3 - 1) = 0.0
# - 学生 1:percentage = (2 - 1)* 100 / (3 - 1) = 50.0
# - 学生 3:percentage = (3 - 1)* 100 / (3 - 1) = 100.0
#对于院系 2:
# - 学生 2: percentage = (1 - 1) * 100 / (2 - 1) = 0.0
# - 学生 8: percentage = (1 - 1) * 100 / (2 - 1) = 0.0
# 
#
# Related Topics 数据库 👍 1 👎 0

public class ComputeTheRankAsAPercentage{
	public static void main(String[] args) {
		Solution solution = new ComputeTheRankAsAPercentage().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select b.student_id,a.department_id,ifnull(round((b.rn-1)*100/(a.cnt-1),2),0) percentage from
(select department_id,count(student_id) cnt from Students group by department_id) a
left join (select *,rank() over(partition by department_id order by mark desc) rn from Students) b
on a.department_id=b.department_id

#leetcode submit region end(Prohibit modification and deletion)

}
