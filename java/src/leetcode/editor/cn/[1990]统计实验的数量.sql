package leetcode.editor.cn;

#表: Experiments 
#
# 
#+-----------------+------+
#| Column Name     | Type |
#+-----------------+------+
#| experiment_id   | int  |
#| platform        | enum |
#| experiment_name | enum |
#+-----------------+------+
#
#experiment_id 是这个表的主键.
#platform 是枚举类型的，取值是这三种 ('Android', 'IOS', 'Web') 之一.
#experiment_name 也是枚举类型的，取值是这三种 ('Reading', 'Sports', 'Programming') 之一.
#这个表包含有关随机实验人员进行的实验的 ID、用于做实验的平台以及实验名称的信息。
# 
#
# 
#
# 写一个 SQL 查询语句，以报告在给定三个实验平台中每种实验完成的次数。请注意，每一对（实验平台、实验名称）都应包含在输出中，包括平台上实验次数是零的。 
#
# 结果可以以任意顺序给出。 
#
# 查询的结果如下所示： 
#
# 
#
# 示例： 
#
# 
#输入：
#Experiments table:
#+---------------+----------+-----------------+
#| experiment_id | platform | experiment_name |
#+---------------+----------+-----------------+
#| 4             | IOS      | Programming     |
#| 13            | IOS      | Sports          |
#| 14            | Android  | Reading         |
#| 8             | Web      | Reading         |
#| 12            | Web      | Reading         |
#| 18            | Web      | Programming     |
#+---------------+----------+-----------------+
#输出：
#+----------+-----------------+-----------------+
#| platform | experiment_name | num_experiments |
#+----------+-----------------+-----------------+
#| Android  | Reading         | 1               |
#| Android  | Sports          | 0               |
#| Android  | Programming     | 0               |
#| IOS      | Reading         | 0               |
#| IOS      | Sports          | 1               |
#| IOS      | Programming     | 1               |
#| Web      | Reading         | 2               |
#| Web      | Sports          | 0               |
#| Web      | Programming     | 1               |
#+----------+-----------------+-----------------+
#解释：
#在安卓平台上, 我们只做了一个"Reading" 实验.
#在 "IOS" 平台上，我们做了一个"Sports" 实验和一个"Programming" 实验.
#在 "Web" 平台上，我们做了两个"Reading" 实验和一个"Programming" 实验.
# 
#
# Related Topics 数据库 👍 11 👎 0

public class CountTheNumberOfExperiments{
	public static void main(String[] args) {
		Solution solution = new CountTheNumberOfExperiments().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select c.platform,c.experiment_name,count(d.experiment_id) num_experiments from
-- (select * from
-- (select 'Android' platform
-- union
-- select 'IOS' platform
-- union
-- select 'Web' platform) a,(
-- select 'Reading' experiment_name
-- union
-- select 'Sports' experiment_name
-- union
-- select 'Programming' experiment_name) b) c left join Experiments d on c.platform=d.platform and c.experiment_name=d.experiment_name
-- group by c.platform,c.experiment_name

select a.platform,b.experiment_name,count(d.experiment_id) num_experiments from
(select 'Android' platform
union
select 'IOS' platform
union
select 'Web' platform) a join (
select 'Reading' experiment_name
union
select 'Sports' experiment_name
union
select 'Programming' experiment_name) b left join Experiments d on a.platform=d.platform and b.experiment_name=d.experiment_name
group by a.platform,b.experiment_name

#leetcode submit region end(Prohibit modification and deletion)

}
