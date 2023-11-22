package leetcode.editor.cn;

#表: Person 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| person_id   | int     |
#| name        | varchar |
#| profession  | ENUM    |
#+-------------+---------+
#person_id 是该表的主键（具有唯一值的列）。
#该表中的每一行都包含一个人的 ID、姓名和职业。
#profession 是 ENUM 类型，其值为 ('Doctor', 'Singer', 'Actor', 'Player', 'Engineer', 
#'Lawyer') 之一。
# 
#
# 
#
# 编写一个解决方案报告每个人的名字，后面是他们职业的第一个字母，用括号括起来。 
#
# 返回按 person_id 降序排列 的结果表。 
#
# 返回结果格式示例如下。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Person 表:
#+-----------+-------+------------+
#| person_id | name  | profession |
#+-----------+-------+------------+
#| 1         | Alex  | Singer     |
#| 3         | Alice | Actor      |
#| 2         | Bob   | Player     |
#| 4         | Messi | Doctor     |
#| 6         | Tyson | Engineer   |
#| 5         | Meir  | Lawyer     |
#+-----------+-------+------------+
#输出: 
#+-----------+----------+
#| person_id | name     |
#+-----------+----------+
#| 6         | Tyson(E) |
#| 5         | Meir(L)  |
#| 4         | Messi(D) |
#| 3         | Alice(A) |
#| 2         | Bob(P)   |
#| 1         | Alex(S)  |
#+-----------+----------+
#解释: 请注意，在名称和职业的第一个字母之间不应该有任何空白。 
#
# Related Topics 数据库 👍 2 👎 0

public class ConcatenateTheNameAndTheProfession{
	public static void main(String[] args) {
		Solution solution = new ConcatenateTheNameAndTheProfession().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select person_id,concat(name,'(',left(profession,1),')') name from Person order by person_id desc

#leetcode submit region end(Prohibit modification and deletion)

}
