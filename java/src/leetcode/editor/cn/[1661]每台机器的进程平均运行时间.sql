package leetcode.editor.cn;

#表: Activity 
#
# 
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| machine_id     | int     |
#| process_id     | int     |
#| activity_type  | enum    |
#| timestamp      | float   |
#+----------------+---------+
#该表展示了一家工厂网站的用户活动。
#(machine_id, process_id, activity_type) 是当前表的主键（具有唯一值的列的组合）。
#machine_id 是一台机器的ID号。
#process_id 是运行在各机器上的进程ID号。
#activity_type 是枚举类型 ('start', 'end')。
#timestamp 是浮点类型,代表当前时间(以秒为单位)。
#'start' 代表该进程在这台机器上的开始运行时间戳 , 'end' 代表该进程在这台机器上的终止运行时间戳。
#同一台机器，同一个进程都有一对开始时间戳和结束时间戳，而且开始时间戳永远在结束时间戳前面。 
#
# 
#
# 现在有一个工厂网站由几台机器运行，每台机器上运行着 相同数量的进程 。编写解决方案，计算每台机器各自完成一个进程任务的平均耗时。 
#
# 完成一个进程任务的时间指进程的'end' 时间戳 减去 'start' 时间戳。平均耗时通过计算每台机器上所有进程任务的总耗费时间除以机器上的总进程数量获得
#。 
#
# 结果表必须包含machine_id（机器ID） 和对应的 average time（平均耗时） 别名 processing_time，且四舍五入保留3位小数
#。 
#
# 以 任意顺序 返回表。 
#
# 具体参考例子如下。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Activity table:
#+------------+------------+---------------+-----------+
#| machine_id | process_id | activity_type | timestamp |
#+------------+------------+---------------+-----------+
#| 0          | 0          | start         | 0.712     |
#| 0          | 0          | end           | 1.520     |
#| 0          | 1          | start         | 3.140     |
#| 0          | 1          | end           | 4.120     |
#| 1          | 0          | start         | 0.550     |
#| 1          | 0          | end           | 1.550     |
#| 1          | 1          | start         | 0.430     |
#| 1          | 1          | end           | 1.420     |
#| 2          | 0          | start         | 4.100     |
#| 2          | 0          | end           | 4.512     |
#| 2          | 1          | start         | 2.500     |
#| 2          | 1          | end           | 5.000     |
#+------------+------------+---------------+-----------+
#输出：
#+------------+-----------------+
#| machine_id | processing_time |
#+------------+-----------------+
#| 0          | 0.894           |
#| 1          | 0.995           |
#| 2          | 1.456           |
#+------------+-----------------+
#解释：
#一共有3台机器,每台机器运行着两个进程.
#机器 0 的平均耗时: ((1.520 - 0.712) + (4.120 - 3.140)) / 2 = 0.894
#机器 1 的平均耗时: ((1.550 - 0.550) + (1.420 - 0.430)) / 2 = 0.995
#机器 2 的平均耗时: ((4.512 - 4.100) + (5.000 - 2.500)) / 2 = 1.456 
#
# Related Topics 数据库 👍 88 👎 0

public class AverageTimeOfProcessPerMachine{
	public static void main(String[] args) {
		Solution solution = new AverageTimeOfProcessPerMachine().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select machine_id,round(avg(time),3) processing_time from
-- (select machine_id,process_id,sum(if(activity_type='start',-timestamp,timestamp)) time from Activity group by machine_id,process_id) a
-- group by machine_id

-- select
--     a1.machine_id,
--     round(avg(a2.timestamp -a1.timestamp ),3) as processing_time
-- from  Activity as a1 join Activity as a2 on
--             a1.machine_id=a2.machine_id and
--             a1.process_id=a2.process_id and
--             a1.activity_type ='start' and
--             a2.activity_type ='end'
-- group by machine_id;

select machine_id,round(avg(if(activity_type='start', -timestamp, timestamp))*2, 3) as processing_time
from Activity
group by machine_id;

#leetcode submit region end(Prohibit modification and deletion)

}
