package leetcode.editor.cn;

#表: Person 
#
# 
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| id          | int     |
#| email       | varchar |
#+-------------+---------+
#id是该表的主键列。
#该表的每一行包含一封电子邮件。电子邮件将不包含大写字母。
# 
#
# 
#
# 删除 所有重复的电子邮件，只保留一个具有最小 id 的唯一电子邮件。 
#
# （对于 SQL 用户，请注意你应该编写一个 DELETE 语句而不是 SELECT 语句。） 
#
# （对于 Pandas 用户，请注意你应该直接修改 Person 表。） 
#
# 运行脚本后，显示的答案是 Person 表。驱动程序将首先编译并运行您的代码片段，然后再显示 Person 表。Person 表的最终顺序 无关紧要 。 
#
# 返回结果格式如下示例所示。 
#
# 
#
# 示例 1: 
#
# 
#输入: 
#Person 表:
#+----+------------------+
#| id | email            |
#+----+------------------+
#| 1  | john@example.com |
#| 2  | bob@example.com  |
#| 3  | john@example.com |
#+----+------------------+
#输出: 
#+----+------------------+
#| id | email            |
#+----+------------------+
#| 1  | john@example.com |
#| 2  | bob@example.com  |
#+----+------------------+
#解释: john@example.com重复两次。我们保留最小的Id = 1。 
#
# 👍 745 👎 0

public class DeleteDuplicateEmails{
	public static void main(String[] args) {
		Solution solution = new DeleteDuplicateEmails().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- delete from Person
-- where id not in (select min(id) id from Person group by email having count(email)>1)
-- and email in (select email from Person group by email having count(email)>1)

-- delete a from Person a,Person b where a.email=b.email and a.id>b.id

-- delete from Person where id not in (select id from (select min(id) id from Person group by email) a)

delete from Person where id in (select a.id from (select *, dense_rank() over(partition by email order by id) rn from Person) a where a.rn>1)

#leetcode submit region end(Prohibit modification and deletion)

}
