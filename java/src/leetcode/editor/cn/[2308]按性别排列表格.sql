package leetcode.editor.cn;

#表: Genders 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| user_id     | int     |
#| gender      | varchar |
#+-------------+---------+
#user_id 是该表的主键(具有唯一值的列)。
#gender 的值是 'female', 'male','other' 之一。
#该表中的每一行都包含用户的 ID 及其性别。
#表格中 'female', 'male','other' 数量相等。
# 
#
# 
#
# 编写一个解决方案以重新排列 Genders 表，使行按顺序在 'female', 'other' 和 'male' 之间交替。同时每种性别按照 user_
#id 升序进行排序。 按 上述顺序 返回结果表。 返回结果格式如以下示例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Genders 表:
#+---------+--------+
#| user_id | gender |
#+---------+--------+
#| 4       | male   |
#| 7       | female |
#| 2       | other  |
#| 5       | male   |
#| 3       | female |
#| 8       | male   |
#| 6       | other  |
#| 1       | other  |
#| 9       | female |
#+---------+--------+
#输出: 
#+---------+--------+
#| user_id | gender |
#+---------+--------+
#| 3       | female |1
#| 1       | other  |2
#| 4       | male   |3
#| 7       | female |4 2
#| 2       | other  |5
#| 5       | male   |6
#| 9       | female |7 3
#| 6       | other  |
#| 8       | male   |
#+---------+--------+
#解释: 
#女性：ID 3、7、9。
#其他性别：ID 1、2、6。
#男性：ID 4、5、8。
#我们在 'female', 'other','male' 之间交替排列表。
#注意，每种性别都是按 user_id 升序排序的。
# 
#
# Related Topics 数据库 👍 7 👎 0

public class ArrangeTableByGender{
	public static void main(String[] args) {
		Solution solution = new ArrangeTableByGender().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select user_id,gender from
-- (select *,row_number() over(order by user_id)*3-2 rn from Genders where gender='female'
-- union all
-- select *,row_number() over(order by user_id)*3-1 rn from Genders where gender='other'
-- union all
-- select *,row_number() over(order by user_id)*3 rn from Genders where gender='male') a
-- order by rn

with t1 as(
    select *,
    row_number() over(partition by gender order by user_id asc) as rn
    from Genders
    )

select user_id,gender from t1
order by rn asc,
         field(gender,"female","other","male") asc

#leetcode submit region end(Prohibit modification and deletion)

}
