package leetcode.editor.cn;

#表：Tasks 
#
# 
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| task_id        | int     |
#| subtasks_count | int     |
#+----------------+---------+
#task_id 具有唯一值的列。
#task_id 表示的为主任务的id,每一个task_id被分为了多个子任务(subtasks)，subtasks_count表示为子任务的个数（n），它的值
#表示了子任务的索引从1到n。
#本表保证2 <=subtasks_count<= 20。
# 
#
# 
#
# 表： Executed 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| task_id       | int     |
#| subtask_id    | int     |
#+---------------+---------+
#(task_id, subtask_id) 是该表中具有唯一值的列的组合。
#每一行表示标记为task_id的主任务与标记为subtask_id的子任务被成功执行。
#本表 保证 ，对于每一个task_id，subtask_id <= subtasks_count。
# 
#
# 
#
# 编写解决方案报告没有被执行的（主任务，子任务）对，即没有被执行的（task_id, subtask_id）。 
#
# 以 任何顺序 返回即可。 
#
# 查询结果格式如下。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Tasks 表:
#+---------+----------------+
#| task_id | subtasks_count |
#+---------+----------------+
#| 1       | 3              |
#| 2       | 2              |
#| 3       | 4              |
#+---------+----------------+
#Executed 表:
#+---------+------------+
#| task_id | subtask_id |
#+---------+------------+
#| 1       | 2          |
#| 3       | 1          |
#| 3       | 2          |
#| 3       | 3          |
#| 3       | 4          |
#+---------+------------+
#输出：
#+---------+------------+
#| task_id | subtask_id |
#+---------+------------+
#| 1       | 1          |
#| 1       | 3          |
#| 2       | 1          |
#| 2       | 2          |
#+---------+------------+
#解释：
#Task 1 被分成了 3 subtasks (1, 2, 3)。只有 subtask 2 被成功执行, 所以我们返回 (1, 1) 和 (1, 3) 这两个
#主任务子任务对。
#Task 2 被分成了 2 subtasks (1, 2)。没有一个subtask被成功执行, 因此我们返回(2, 1)和(2, 2)。
#Task 3 被分成了 4 subtasks (1, 2, 3, 4)。所有的subtask都被成功执行，因此对于Task 3,我们不返回任何值。 
#
# Related Topics 数据库 👍 33 👎 0

public class FindTheSubtasksThatDidNotExecute{
	public static void main(String[] args) {
		Solution solution = new FindTheSubtasksThatDidNotExecute().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

with recursive tmp as (
select task_id,subtasks_count num from Tasks
union all
select task_id,num-1 num from tmp where num-1>0
)

select a.task_id,a.num subtask_id from tmp a left join Executed b on a.task_id=b.task_id and a.num=b.subtask_id
where b.subtask_id is null

#leetcode submit region end(Prohibit modification and deletion)

}
