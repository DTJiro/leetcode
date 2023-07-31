package leetcode.editor.cn;

#表： student 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| name        | varchar |
#| continent   | varchar |
#+-------------+---------+
#该表没有主键。它可能包含重复的行。
#该表的每一行表示学生的名字和他们来自的大陆。
# 
#
# 
#
# 一所学校有来自亚洲、欧洲和美洲的学生。 
#
# 写一个查询语句实现对大洲（continent）列的 透视表 操作，使得每个学生按照姓名的字母顺序依次排列在对应的大洲下面。输出的标题应依次为美洲（
#America）、亚洲（Asia）和欧洲（Europe）。 
#
# 测试用例的生成使得来自美国的学生人数不少于亚洲或欧洲的学生人数。 
#
# 查询结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Student table:
#+--------+-----------+
#| name   | continent |
#+--------+-----------+
#| Jane   | America   |
#| Pascal | Europe    |
#| Xi     | Asia      |
#| Jack   | America   |
#+--------+-----------+
#输出: 
#+---------+------+--------+
#| America | Asia | Europe |
#+---------+------+--------+
#| Jack    | Xi   | Pascal |
#| Jane    | null | null   |
#+---------+------+--------+ 
#
# 
#
# 进阶：如果不能确定哪个大洲的学生数最多，你可以写出一个查询去生成上述学生报告吗？ 
#
# Related Topics 数据库 👍 83 👎 0

public class StudentsReportByGeography{
	public static void main(String[] args) {
		Solution solution = new StudentsReportByGeography().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select a.America,b.Asia,c.Europe from
-- (select name America,row_number() over(order by name) rn from student where continent='America') a
-- left join (select name Asia,row_number() over(order by name) rn from student where continent='Asia') b on a.rn=b.rn
-- left join (select name Europe,row_number() over(order by name) rn from student where continent='Europe') c on a.rn=c.rn

-- SELECT
--     MAX(CASE continent WHEN 'America' THEN NAME ELSE NULL END) AS America,
--     MAX(CASE continent WHEN 'Asia' THEN NAME ELSE NULL END) AS Asia,
--     MAX(CASE continent WHEN 'Europe' THEN NAME ELSE NULL END) AS Europe
-- FROM
--     (SELECT *, ROW_NUMBER() OVER (PARTITION BY continent ORDER BY NAME) rk FROM student) t
-- GROUP BY rk;

select
max(case when continent='America' then name else null end) America,
max(case when continent='Asia' then name else null end) Asia,
max(case when continent='Europe' then name else null end) Europe
from
(select *,row_number() over(partition by continent order by name) rn from student) a
group by a.rn

#leetcode submit region end(Prohibit modification and deletion)

}
