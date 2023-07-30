#给如下两个表，写一个查询语句，求出在每一个工资发放日，每个部门的平均工资与公司的平均工资的比较结果 （高 / 低 / 相同）。 
#
# 
#
# 表： salary 
#
# | id | employee_id | amount | pay_date   |
#|----|-------------|--------|------------|
#| 1  | 1           | 9000   | 2017-03-31 |
#| 2  | 2           | 6000   | 2017-03-31 |
#| 3  | 3           | 10000  | 2017-03-31 |
#| 4  | 1           | 7000   | 2017-02-28 |
#| 5  | 2           | 6000   | 2017-02-28 |
#| 6  | 3           | 8000   | 2017-02-28 |
# 
#
# 
#
# employee_id 字段是表 employee 中 employee_id 字段的外键。 
#
# 
#
# | employee_id | department_id |
#|-------------|---------------|
#| 1           | 1             |
#| 2           | 2             |
#| 3           | 2             |
# 
#
# 
#
# 对于如上样例数据，结果为： 
#
# 
#
# | pay_month | department_id | comparison  |
#|-----------|---------------|-------------|
#| 2017-03   | 1             | higher      |
#| 2017-03   | 2             | lower       |
#| 2017-02   | 1             | same        |
#| 2017-02   | 2             | same        |
# 
#
# 
#
# 解释 
#
# 
#
# 在三月，公司的平均工资是 (9000+6000+10000)/3 = 8333.33... 
#
# 
#
# 由于部门 '1' 里只有一个 employee_id 为 '1' 的员工，所以部门 '1' 的平均工资就是此人的工资 9000 。因为 9000 > 833
#3.33 ，所以比较结果是 'higher'。 
#
# 
#
# 第二个部门的平均工资为 employee_id 为 '2' 和 '3' 两个人的平均工资，为 (6000+10000)/2=8000 。因为 8000 < 
#8333.33 ，所以比较结果是 'lower' 。 
#
# 
#
# 在二月用同样的公式求平均工资并比较，比较结果为 'same' ，因为部门 '1' 和部门 '2' 的平均工资与公司的平均工资相同，都是 7000 。 
#
# 
#
# Related Topics 数据库 👍 55 👎 0


#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select c.date pay_month ,c.department_id,
case when c.money>d.avg_sal then 'higher' when c.money<d.avg_sal then 'lower' else 'same' end comparison
from
(select date_format(a.pay_date,'%Y-%m') date,b.department_id,avg(amount) money
from salary a,employee b where a.employee_id=b.employee_id
group by date,b.department_id) c,
(select date_format(pay_date,'%Y-%m') date,avg(amount) avg_sal from salary group by date) d where c.date=d.date

#leetcode submit region end(Prohibit modification and deletion)
