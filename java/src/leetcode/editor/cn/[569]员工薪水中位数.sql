package leetcode.editor.cn;

#表: Employee 
#
# 
#+--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| id           | int     |
#| company      | varchar |
#| salary       | int     |
#+--------------+---------+
#Id是该表的主键列。
#该表的每一行表示公司和一名员工的工资。
# 
#
# 
#
# 写一个SQL查询，找出每个公司的工资中位数。 
#
# 以 任意顺序 返回结果表。 
#
# 查询结果格式如下所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Employee 表:
#+----+---------+--------+
#| id | company | salary |
#+----+---------+--------+
#| 1  | A       | 2341   |
#| 2  | A       | 341    |
#| 3  | A       | 15     |
#| 4  | A       | 15314  |
#| 5  | A       | 451    |
#| 6  | A       | 513    |
#| 7  | B       | 15     |
#| 8  | B       | 13     |
#| 9  | B       | 1154   |
#| 10 | B       | 1345   |
#| 11 | B       | 1221   |
#| 12 | B       | 234    |
#| 13 | C       | 2345   |
#| 14 | C       | 2645   |
#| 15 | C       | 2645   |
#| 16 | C       | 2652   |
#| 17 | C       | 65     |
#+----+---------+--------+
#输出: 
#+----+---------+--------+
#| id | company | salary |
#+----+---------+--------+
#| 5  | A       | 451    |
#| 6  | A       | 513    |
#| 12 | B       | 234    |
#| 9  | B       | 1154   |
#| 14 | C       | 2645   |
#+----+---------+--------+
# 
#
# 
#
# 进阶: 你能在不使用任何内置函数或窗口函数的情况下解决它吗? 
#
# Related Topics 数据库 👍 119 👎 0

public class MedianEmployeeSalary{
	public static void main(String[] args) {
		Solution solution = new MedianEmployeeSalary().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- 给每个公司的薪酬排序后赋予行号，然后使用总数得出中间值
select c.id id,c.company,c.salary from
(select a.*,if(@q=a.company,@r:=@r+1,@r:=1) sort,@q:=a.company from Employee a,(select @r:=1,@q:=null) b
order by a.company,a.salary,a.id) c inner join (select company,count(*) count from Employee group by company) d
-- where c.company = d.company and (c.sort = floor((d.count+1)/2) or c.sort = floor((d.count+2)/2))
where c.company = d.company and c.sort >= d.count/2 and c.sort <= d.count/2+1

-- select c.id id,c.company,c.salary from
-- (select *,
-- row_number() over(partition by company order by salary,id) rn,
-- count(id) over(partition by company) count
-- from Employee) c where rn>=count/2 and rn<=count/2+1

-- -- 正反序
-- select c.id id,c.company,c.salary from
-- (select *,
-- row_number() over(partition by company order by salary,id) rn,
-- row_number() over(partition by company order by salary desc,id desc) rn1,
-- count(id) over(partition by company) count
-- from Employee) c where rn>=count/2 and rn1>=count/2

-- -- 高版本的mysql会报错，不推荐
-- select id,company,salary from Employee where id in
-- (select a.id from Employee a,Employee b
-- where a.company=b.company
-- group by a.id
-- having sum(case when a.salary<=b.salary then 1 else 0 end)>=count(*)/2
-- and sum(case when a.salary>=b.salary then 1 else 0 end)>=count(*)/2)
-- group by company,salary

#leetcode submit region end(Prohibit modification and deletion)

}
