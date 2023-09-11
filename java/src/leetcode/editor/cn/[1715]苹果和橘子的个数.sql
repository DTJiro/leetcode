package leetcode.editor.cn;

#表： Boxes 
#
# 
#+--------------+------+
#| Column Name  | Type |
#+--------------+------+
#| box_id       | int  |
#| chest_id     | int  |
#| apple_count  | int  |
#| orange_count | int  |
#+--------------+------+
#box_id 是该表的主键。
#chest_id 是 chests 表的外键。
#该表包含大箱子 (box) 中包含的苹果和橘子的个数。每个大箱子中可能包含一个小盒子 (chest) ，小盒子中也包含若干苹果和橘子。 
#
# 
#
# 表： Chests 
#
# 
#+--------------+------+
#| Column Name  | Type |
#+--------------+------+
#| chest_id     | int  |
#| apple_count  | int  |
#| orange_count | int  |
#+--------------+------+
#chest_id 是该表的主键。
#该表包含小盒子的信息，以及小盒子中包含的苹果和橘子的个数。 
#
# 
#
# 编写 SQL 语句，查询每个大箱子中苹果和橘子的个数。如果大箱子中包含小盒子，还应当包含小盒子中苹果和橘子的个数。 
#
# 以任意顺序返回结果表。 
#
# 查询结果的格式如下示例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Boxes 表：
#+--------+----------+-------------+--------------+
#| box_id | chest_id | apple_count | orange_count |
#+--------+----------+-------------+--------------+
#| 2      | null     | 6           | 15           |
#| 18     | 14       | 4           | 15           |
#| 19     | 3        | 8           | 4            |
#| 12     | 2        | 19          | 20           |
#| 20     | 6        | 12          | 9            |
#| 8      | 6        | 9           | 9            |
#| 3      | 14       | 16          | 7            |
#+--------+----------+-------------+--------------+
#Chests 表：
#+----------+-------------+--------------+
#| chest_id | apple_count | orange_count |
#+----------+-------------+--------------+
#| 6        | 5           | 6            |
#| 14       | 20          | 10           |
#| 2        | 8           | 8            |
#| 3        | 19          | 4            |
#| 16       | 19          | 19           |
#+----------+-------------+--------------+
#输出：
#+-------------+--------------+
#| apple_count | orange_count |
#+-------------+--------------+
#| 151         | 123          |
#+-------------+--------------+
#解释：
#大箱子 2 中有 6 个苹果和 15 个橘子。
#大箱子 18 中有 4 + 20 (在小盒子中) = 24 个苹果和 15 + 10 (在小盒子中) = 25 个橘子。
#大箱子 19 中有 8 + 19 (在小盒子中) = 27 个苹果和 4 + 4 (在小盒子中) = 8 个橘子。
#大箱子 12 中有 19 + 8 (在小盒子中) = 27 个苹果和 20 + 8 (在小盒子中) = 28 个橘子。
#大箱子 20 中有 12 + 5 (在小盒子中) = 17 个苹果和 9 + 6 (在小盒子中) = 15 个橘子。
#大箱子 8 中有 9 + 5 (在小盒子中) = 14 个苹果和 9 + 6 (在小盒子中) = 15 个橘子。
#大箱子 3 中有 16 + 20 (在小盒子中) = 36 个苹果和 7 + 10 (在小盒子中) = 17 个橘子。
#苹果的总个数 = 6 + 24 + 27 + 27 + 17 + 14 + 36 = 151
#橘子的总个数 = 15 + 25 + 8 + 28 + 15 + 15 + 17 = 123 
#
# Related Topics 数据库 👍 11 👎 0

public class CountApplesAndOranges{
	public static void main(String[] args) {
		Solution solution = new CountApplesAndOranges().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select sum(a.apple_count+ifnull(b.apple_count,0)) apple_count,sum(a.orange_count+ifnull(b.orange_count,0)) orange_count
from Boxes a left join Chests b on a.chest_id=b.chest_id

#leetcode submit region end(Prohibit modification and deletion)

}
