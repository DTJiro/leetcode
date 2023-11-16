package leetcode.editor.cn;

#表: CoffeeShop 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| id          | int     |
#| drink       | varchar |
#+-------------+---------+
#id 是该表的主键（具有唯一值的列）。
#该表中的每一行都显示了订单 id 和所点饮料的名称。一些饮料行为 null。
# 
#
# 
#
# 编写一个解决方案将 drink 的 null 值替换为前面最近一行不为 null 的 drink。保证表第一行的 drink 不为 null。 
#
# 返回 与输入顺序相同的 结果表。 
#
# 查询结果格式示例如下。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#CoffeeShop 表:
#+----+-------------------+
#| id | drink             |
#+----+-------------------+
#| 9  | Rum and Coke      |
#| 6  | null              |
#| 7  | null              |
#| 3  | St Germain Spritz |
#| 1  | Orange Margarita  |
#| 2  | null              |
#+----+-------------------+
#输出: 
#+----+-------------------+
#| id | drink             |
#+----+-------------------+
#| 9  | Rum and Coke      |
#| 6  | Rum and Coke      |
#| 7  | Rum and Coke      |
#| 3  | St Germain Spritz |
#| 1  | Orange Margarita  |
#| 2  | Orange Margarita  |
#+----+-------------------+
#解释: 
#对于 ID 6，之前不为空的值来自 ID 9。我们将 null 替换为 "Rum and Coke"。
#对于 ID 7，之前不为空的值来自 ID 9。我们将 null 替换为 "Rum and Coke"。
#对于 ID 2，之前不为空的值来自 ID 1。我们将 null 替换为 "Orange Margarita"。
#请注意，输出中的行与输入中的行相同。
# 
#
# Related Topics 数据库 👍 8 👎 0

public class ChangeNullValuesInATableToThePreviousValue{
	public static void main(String[] args) {
		Solution solution = new ChangeNullValuesInATableToThePreviousValue().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select id,@q:=ifnull(drink,@q) drink from CoffeeShop

WITH Shop AS(
    SELECT *, ROW_NUMBER() OVER () AS idx
    FROM CoffeeShop )

SELECT id, drink
FROM
    (SELECT s1.id AS id, s2.drink AS drink, RANK() OVER (PARTITION BY s1.id ORDER BY s2.idx DESC) AS rk
     FROM Shop s1
              LEFT JOIN Shop s2
                        ON s1.idx >= s2.idx AND s2.drink IS NOT NULL
     ORDER BY s1.idx) tmp
WHERE rk = 1

#leetcode submit region end(Prohibit modification and deletion)

}
