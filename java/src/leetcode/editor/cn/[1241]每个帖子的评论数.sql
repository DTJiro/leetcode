package leetcode.editor.cn;

#表 Submissions 结构如下： 
#
# 
#+---------------+----------+
#| 列名           | 类型     |
#+---------------+----------+
#| sub_id        | int      |
#| parent_id     | int      |
#+---------------+----------+
#上表没有主键, 所以可能会出现重复的行。
#每行可以是一个帖子或对该帖子的评论。
#如果是帖子的话，parent_id 就是 null。
#对于评论来说，parent_id 就是表中对应帖子的 sub_id。
# 
#
# 
#
# 编写 SQL 语句以查找每个帖子的评论数。 
#
# 结果表应包含帖子的 post_id 和对应的评论数 number_of_comments 并且按 post_id 升序排列。 
#
# Submissions 可能包含重复的评论。您应该计算每个帖子的唯一评论数。 
#
# Submissions 可能包含重复的帖子。您应该将它们视为一个帖子。 
#
# 结果表应该按 post_id 升序排序。 
#
# 查询结果格式如下例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入：
#Submissions table:
#+---------+------------+
#| sub_id  | parent_id  |
#+---------+------------+
#| 1       | Null       |
#| 2       | Null       |
#| 1       | Null       |
#| 12      | Null       |
#| 3       | 1          |
#| 5       | 2          |
#| 3       | 1          |
#| 4       | 1          |
#| 9       | 1          |
#| 10      | 2          |
#| 6       | 7          |
#+---------+------------+
#输出：
#+---------+--------------------+
#| post_id | number_of_comments |
#+---------+--------------------+
#| 1       | 3                  |
#| 2       | 2                  |
#| 12      | 0                  |
#+---------+--------------------+
#解释：
#表中 ID 为 1 的帖子有 ID 为 3、4 和 9 的三个评论。表中 ID 为 3 的评论重复出现了，所以我们只对它进行了一次计数。
#表中 ID 为 2 的帖子有 ID 为 5 和 10 的两个评论。
#ID 为 12 的帖子在表中没有评论。
#表中 ID 为 6 的评论是对 ID 为 7 的已删除帖子的评论，因此我们将其忽略。 
#
# Related Topics 数据库 👍 51 👎 0

public class NumberOfCommentsPerPost{
	public static void main(String[] args) {
		Solution solution = new NumberOfCommentsPerPost().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.sub_id post_id,count(distinct b.sub_id) number_of_comments from
(select * from Submissions where parent_id is null) a left join (select * from Submissions where parent_id is not null) b
on a.sub_id=b.parent_id group by a.sub_id order by a.sub_id

#leetcode submit region end(Prohibit modification and deletion)

}
