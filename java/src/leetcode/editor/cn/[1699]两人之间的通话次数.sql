package leetcode.editor.cn;

#表： Calls 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| from_id     | int     |
#| to_id       | int     |
#| duration    | int     |
#+-------------+---------+
#该表没有主键(具有唯一值的列)，它可能包含重复项。
#该表包含 from_id 与 to_id 间的一次电话的时长。
#from_id != to_id
# 
#
# 
#
# 编写解决方案，统计每一对用户 (person1, person2) 之间的通话次数和通话总时长，其中 person1 < person2 。 
#
# 以 任意顺序 返回结果表。 
#
# 返回结果格式如下示例所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Calls 表：
#+---------+-------+----------+
#| from_id | to_id | duration |
#+---------+-------+----------+
#| 1       | 2     | 59       |
#| 2       | 1     | 11       |
#| 1       | 3     | 20       |
#| 3       | 4     | 100      |
#| 3       | 4     | 200      |
#| 3       | 4     | 200      |
#| 4       | 3     | 499      |
#+---------+-------+----------+
#输出：
#+---------+---------+------------+----------------+
#| person1 | person2 | call_count | total_duration |
#+---------+---------+------------+----------------+
#| 1       | 2       | 2          | 70             |
#| 1       | 3       | 1          | 20             |
#| 3       | 4       | 4          | 999            |
#+---------+---------+------------+----------------+
#解释：
#用户 1 和 2 打过 2 次电话，总时长为 70 (59 + 11)。
#用户 1 和 3 打过 1 次电话，总时长为 20。
#用户 3 和 4 打过 4 次电话，总时长为 999 (100 + 200 + 200 + 499)。 
#
# Related Topics 数据库 👍 62 👎 0

public class NumberOfCallsBetweenTwoPersons{
	public static void main(String[] args) {
		Solution solution = new NumberOfCallsBetweenTwoPersons().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select from_id person1,to_id person2,count(*) call_count,sum(duration) total_duration from
-- (select from_id,to_id,duration from Calls where from_id<=to_id
-- union all
-- select to_id from_id,from_id to_id,duration from Calls where from_id>to_id) a
-- group by from_id,to_id

SELECT
    IF(from_id > to_id,to_id,from_id) person1,
    IF(from_id < to_id,to_id,from_id) person2,
    COUNT(*) call_count,
    SUM(duration) total_duration
FROM Calls
GROUP BY person1,person2

#leetcode submit region end(Prohibit modification and deletion)

}
