package leetcode.editor.cn;

#表: Olympic 
#
# 
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| country       | varchar |
#| gold_medals   | int     |
#| silver_medals | int     |
#| bronze_medals | int     |
#+---------------+---------+
#在 SQL 中，country 是该表的主键。
#该表中的每一行都显示了一个国家的名称以及它在奥运会上获得的金、银、铜牌的数量。
# 
#
# 
#
# 奥运名次表的排序规则如下: 
#
# 
# 金牌越多的国家排名第一。 
# 如果金牌数持平，银牌多的国家排名第一。 
# 如果银牌数量持平，铜牌数量最多的国家排名第一。 
# 如果铜牌中出现并列，那么并列的国家将按照字典的升序进行排序。 
# 
#
# 写一个解决方案对奥运表进行排序 
#
# 返回结果格式示例如下。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Olympic 表:
#+-------------+-------------+---------------+---------------+
#| country     | gold_medals | silver_medals | bronze_medals |
#+-------------+-------------+---------------+---------------+
#| China       | 10          | 10            | 20            |
#| South Sudan | 0           | 0             | 1             |
#| USA         | 10          | 10            | 20            |
#| Israel      | 2           | 2             | 3             |
#| Egypt       | 2           | 2             | 2             |
#+-------------+-------------+---------------+---------------+
#输出: 
#+-------------+-------------+---------------+---------------+
#| country     | gold_medals | silver_medals | bronze_medals |
#+-------------+-------------+---------------+---------------+
#| China       | 10          | 10            | 20            |
#| USA         | 10          | 10            | 20            |
#| Israel      | 2           | 2             | 3             |
#| Egypt       | 2           | 2             | 2             |
#| South Sudan | 0           | 0             | 1             |
#+-------------+-------------+---------------+---------------+
#解释: 
#中国和美国之间的联系被它们的字典名称打破了。因为 "China" 在字典上比 "USA" 小，所以它排在第一位。
#以色列排在埃及之前，因为它的铜牌更多。 
#
# Related Topics 数据库 👍 2 👎 0

public class SortTheOlympicTable{
	public static void main(String[] args) {
		Solution solution = new SortTheOlympicTable().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select * from Olympic
order by gold_medals desc,silver_medals desc,bronze_medals desc,country

#leetcode submit region end(Prohibit modification and deletion)

}
