package leetcode.editor.cn;

#Numbers 表： 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| num         | int  |
#| frequency   | int  |
#+-------------+------+
#num 是这张表的主键。这张表的每一行表示某个数字在该数据库中的出现频率。 
#
# 
#中位数 是将数据样本中半数较高值和半数较低值分隔开的值。
#
# 编写一个 SQL 查询，解压 Numbers 表，报告数据库中所有数字的 中位数 。结果四舍五入至 一位小数 。 
#
# 查询结果如下例所示。 
#
# 
#
# 
# 
# 
# 示例： 
# 
# 
# 
#
# 
#输入： 
#Numbers 表：
#+-----+-----------+
#| num | frequency |
#+-----+-----------+
#| 0   | 7         |
#| 1   | 1         |
#| 2   | 3         |
#| 3   | 1         |
#+-----+-----------+
#输出：
#+--------+
#| median |
#+--------+
#| 0.0    |
#+--------+
#解释：
#如果解压这个 Numbers 表，可以得到 [0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3] ，所以中位数是 (0 + 0) / 2 
#= 0 。
# 
#
#
# Related Topics 数据库 👍 102 👎 0

public class FindMedianGivenFrequencyOfNumbers{
	public static void main(String[] args) {
		Solution solution = new FindMedianGivenFrequencyOfNumbers().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- -- 正反序1
-- select round(avg(a.num),1) median from
-- (select *,
-- sum(frequency) over(order by num) rn1,
-- sum(frequency) over(order by num desc) rn2,
-- sum(frequency) over() count
-- from Numbers) a where a.rn1>=count/2 and a.rn2>=count/2

-- -- 使用子查询
-- select round(avg(d.num),1) median from
-- (select *,
-- (select sum(frequency) from Numbers b where a.num>=b.num ) rn1,
-- (select sum(frequency) from Numbers c where a.num<=c.num ) rn2,
-- (select sum(frequency) from Numbers e ) total
-- from Numbers a) d where d.rn1>=d.total/2 and d.rn2>=d.total/2

-- having
select round(avg(a.num),1) median from
(
    select b.num from Numbers b,Numbers c group by b.num
    having sum(if(b.num>=c.num,c.frequency,0)) >= sum(c.frequency)/2
    and sum(if(b.num<=c.num,c.frequency,0)) >= sum(c.frequency)/2
) a

#leetcode submit region end(Prohibit modification and deletion)

}
