package leetcode.editor.cn;

#表：Salary 
#
# 
#+---------------+---------+ 
#| 列名          | 类型    | 
#+---------------+---------+ 
#| emp_id        | int     | 
#| firstname     | varchar |
#| lastname      | varchar |
#| salary        | varchar |
#| department_id | varchar |
#+---------------+---------+
#(emp_id, salary) 是该表的主键(具有唯一值的列的组合)。
#每行包含员工的详细信息和他们每年的薪水，但有些记录是旧的，包含过时的薪资信息。
# 
#
# 找出每个员工的当前薪水，假设薪水每年增加。输出他们的 emp_id 、firstname 、lastname 、salary 和 department_
#id 。 
#
# 按 emp_id 升序排序 返回结果表。 
#
# 返回结果格式如下所示。 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Salary 表:
#+--------+-----------+----------+--------+---------------+
#| emp_id | firstname | lastname | salary | department_id |
#+--------+-----------+----------+--------+---------------+ 
#| 1      | Todd      | Wilson   | 110000 | D1006         |
#| 1      | Todd      | Wilson   | 106119 | D1006         | 
#| 2      | Justin    | Simon    | 128922 | D1005         | 
#| 2      | Justin    | Simon    | 130000 | D1005         | 
#| 3      | Kelly     | Rosario  | 42689  | D1002         | 
#| 4      | Patricia  | Powell   | 162825 | D1004         |
#| 4      | Patricia  | Powell   | 170000 | D1004         |
#| 5      | Sherry    | Golden   | 44101  | D1002         | 
#| 6      | Natasha   | Swanson  | 79632  | D1005         | 
#| 6      | Natasha   | Swanson  | 90000  | D1005         |
#+--------+-----------+----------+--------+---------------+
#输出：
#+--------+-----------+----------+--------+---------------+
#| emp_id | firstname | lastname | salary | department_id |
#+--------+-----------+----------+--------+---------------+ 
#| 1      | Todd      | Wilson   | 110000 | D1006         |
#| 2      | Justin    | Simon    | 130000 | D1005         | 
#| 3      | Kelly     | Rosario  | 42689  | D1002         | 
#| 4      | Patricia  | Powell   | 170000 | D1004         |
#| 5      | Sherry    | Golden   | 44101  | D1002         | 
#| 6      | Natasha   | Swanson  | 90000  | D1005         |
#+--------+-----------+----------+--------+---------------+
#
#解释：
#- emp_id 1 有两条记录，工资分别为 110000 和 106119，其中 110000 是更新后的工资（假设工资每年都会增加）
#- emp_id 2 有两条记录，工资分别为 128922 和 130000，其中 130000 是更新后的工资。
#- emp_id 3 只有一条工资记录，因此这已经是更新后的工资。
#- emp_id 4 有两条记录，工资分别为 162825 和 170000，其中 170000 是更新后的工资。
#- emp_id 5 只有一条工资记录，因此这已经是更新后的工资。
#- emp_id 6 有两条记录，工资分别为 79632 和 90000，其中 90000 是更新后的工资。 
#
# Related Topics 数据库 👍 2 👎 0

public class FindLatestSalaries{
	public static void main(String[] args) {
		Solution solution = new FindLatestSalaries().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select emp_id,firstname,lastname,max(salary) salary,department_id from Salary group by emp_id,firstname,lastname,department_id
order by emp_id

#leetcode submit region end(Prohibit modification and deletion)

}
