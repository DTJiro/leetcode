package leetcode.editor.cn;

#表：Files 
#
# 
#+-------------+---------+
#| 列名        | 类型    |
#+-- ----------+---------+
#| file_name   | varchar |
#| content     | text    |
#+-------------+---------+
#file_name 为该表的主键（具有唯一值的列）。
#每行包含 file_name 和该文件的内容。
# 
#
# 
#
# 编写解决方案，找出单词 'bull' 和 'bear' 作为 独立词 出现的次数，不考虑任何它出现在两侧没有空格的情况（例如，'bullet', 
#'bears', 'bull.'，或者 'bear' 在句首或句尾 不会 被考虑）。 
#
# 返回单词 'bull' 和 'bear' 以及它们对应的出现次数，顺序没有限制 。 
#
# 结果的格式如下所示： 
#
# 
#
# 示例 1： 
#
# 
#输入：
#Files 表:
#+------------+-----------------------------------------------------------------
#-----------------+
#| file_name  | contenet                                                        
#                 | 
#+------------+-----------------------------------------------------------------
#-----------------+
#| draft1.txt | The stock exchange predicts a bull market which would make many 
#investors happy. | 
#| draft2.txt | The stock exchange predicts a bull market which would make many 
#investors happy, |
#|            | but analysts warn of possibility of too much optimism and that 
#in fact we are    |
#|            | awaiting a bear market.                                         
#                 | 
#| draft3.txt | The stock exchange predicts a bull market which would make many 
#investors happy, |
#|            | but analysts warn of possibility of too much optimism and that 
#in fact we are    |
#|            | awaiting a bear market. As always predicting the future market 
#is an uncertain   |
#|            | game and all investors should follow their instincts and best 
#practices.         | 
#+------------+-----------------------------------------------------------------
#-----------------+
#输出： 
#+------+-------+
#| word | count |  
#+------+-------+
#| bull | 3     | 
#| bear | 2     | 
#+------+-------+
#解释：
#- 单词 "bull" 在 "draft1.txt" 中出现1次，在 "draft2.txt" 中出现 1 次，在 "draft3.txt" 中出现 1 次。
#因此，单词 "bull" 的总出现次数为 3 次。
#- 单词 "bear" 在 "draft2.txt" 中出现1次，在 "draft3.txt" 中出现 1 次。因此，单词 "bear" 的总出现次数为 2 
#次。 
#
# Related Topics 数据库 👍 0 👎 0

public class CountOccurrencesInText{
	public static void main(String[] args) {
		Solution solution = new CountOccurrencesInText().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select 'bull' word,count(file_name) count from Files where content like '% bull %'
union all
select 'bear' word,count(file_name) count from Files where content like '% bear %'

#leetcode submit region end(Prohibit modification and deletion)

}
