package leetcode.editor.cn;

#患者信息表： Patients 
#
# 
#+--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| patient_id   | int     |
#| patient_name | varchar |
#| conditions   | varchar |
#+--------------+---------+
#在 SQL 中，patient_id （患者 ID）是该表的主键。
#'conditions' （疾病）包含 0 个或以上的疾病代码，以空格分隔。
#这个表包含医院中患者的信息。 
#
# 
#
# 查询患有 I 类糖尿病的患者 ID （patient_id）、患者姓名（patient_name）以及其患有的所有疾病代码（conditions）。I 类糖
#尿病的代码总是包含前缀 DIAB1 。 
#
# 按 任意顺序 返回结果表。 
#
# 查询结果格式如下示例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Patients表：
#+------------+--------------+--------------+
#| patient_id | patient_name | conditions   |
#+------------+--------------+--------------+
#| 1          | Daniel       | YFEV COUGH   |
#| 2          | Alice        |              |
#| 3          | Bob          | DIAB100 MYOP |
#| 4          | George       | ACNE DIAB100 |
#| 5          | Alain        | DIAB201      |
#+------------+--------------+--------------+
#输出：
#+------------+--------------+--------------+
#| patient_id | patient_name | conditions   |
#+------------+--------------+--------------+
#| 3          | Bob          | DIAB100 MYOP |
#| 4          | George       | ACNE DIAB100 | 
#+------------+--------------+--------------+
#解释：Bob 和 George 都患有代码以 DIAB1 开头的疾病。 
#
# Related Topics 数据库 👍 94 👎 0

public class PatientsWithACondition{
	public static void main(String[] args) {
		Solution solution = new PatientsWithACondition().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select * from Patients where conditions like 'DIAB1%' or conditions like '% DIAB1%'

#leetcode submit region end(Prohibit modification and deletion)

}
