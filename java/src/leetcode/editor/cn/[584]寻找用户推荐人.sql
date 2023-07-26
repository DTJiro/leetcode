package leetcode.editor.cn;

#给定表 customer ，里面保存了所有客户信息和他们的推荐人。 
#
# 
#+------+------+-----------+
#| id   | name | referee_id|
#+------+------+-----------+
#|    1 | Will |      NULL |
#|    2 | Jane |      NULL |
#|    3 | Alex |         2 |
#|    4 | Bill |      NULL |
#|    5 | Zack |         1 |
#|    6 | Mark |         2 |
#+------+------+-----------+
# 
#
# 写一个查询语句，返回一个客户列表，列表中客户的推荐人的编号都 不是 2。 
#
# 对于上面的示例数据，结果为： 
#
# 
#+------+
#| name |
#+------+
#| Will |
#| Jane |
#| Bill |
#| Zack |
#+------+
# 
#
# Related Topics 数据库 👍 204 👎 0

public class FindCustomerReferee{
	public static void main(String[] args) {
		Solution solution = new FindCustomerReferee().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

-- select name from customer where ifnull(referee_id,0) != 2
select name from customer where referee_id != 2 or referee_id is null

#leetcode submit region end(Prohibit modification and deletion)

}
