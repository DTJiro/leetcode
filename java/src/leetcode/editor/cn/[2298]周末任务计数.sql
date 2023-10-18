package leetcode.editor.cn;

#表: Tasks 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| task_id     | int  |
#| assignee_id | int  |
#| submit_date | date |
#+-------------+------+
#task_id 是该表的主键（具有唯一值的列）。
#此表中的每一行都包含任务 ID、委托人 ID 和提交日期。
# 
#
# 
#
# 编写一个解决方案来报告： 
#
# 
# 在周末 (周六，周日) 提交的任务的数量 weekend_cnt，以及 
# 工作日内提交的任务数 working_cnt。 
# 
#
# 按 任意顺序 返回结果表。 返回结果格式如以下示例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Tasks 表:
#+---------+-------------+-------------+
#| task_id | assignee_id | submit_date |
#+---------+-------------+-------------+
#| 1       | 1           | 2022-06-13  |
#| 2       | 6           | 2022-06-14  |
#| 3       | 6           | 2022-06-15  |
#| 4       | 3           | 2022-06-18  |
#| 5       | 5           | 2022-06-19  |
#| 6       | 7           | 2022-06-19  |
#+---------+-------------+-------------+
#输出: 
#+-------------+-------------+
#| weekend_cnt | working_cnt |
#+-------------+-------------+
#| 3           | 3           |
#+-------------+-------------+
#解释: 
#Task 1 是在周一提交的。
#Task 2 是在周二提交的。
#Task 3 是在周三提交的。
#Task 4 是在周六提交的。
#Task 5 是在周日提交的。
#Task 6 是在周日提交的。
#3 个任务是在周末提交的。
#3 个任务是在工作日提交的。
# 
#
# Related Topics 数据库 👍 2 👎 0

public class TasksCountInTheWeekend{
	public static void main(String[] args) {
		Solution solution = new TasksCountInTheWeekend().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select sum(weekday(submit_date)=5 or weekday(submit_date)=6) weekend_cnt,sum(weekday(submit_date)!=5 and weekday(submit_date)!=6) working_cnt from Tasks

#leetcode submit region end(Prohibit modification and deletion)

}
