package leetcode.editor.cn;

#SurveyLog 表： 
#
# 
# 
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| id          | int  |
#| action      | ENUM |
#| question_id | int  |
#| answer_id   | int  |
#| q_num       | int  |
#| timestamp   | int  |
#+-------------+------+
#这张表没有主键，其中可能包含重复项。
#action 是一个 ENUM 数据，可以是 "show"、"answer" 或者 "skip" 。
#这张表的每一行表示：ID = id 的用户对 question_id 的问题在 timestamp 时间进行了 action 操作。
#如果用户对应的操作是 "answer" ，answer_id 将会是对应答案的 id ，否则，值为 null 。
#q_num 是该问题在当前会话中的数字顺序。
# 
# 
# 
#
# 
#
# 回答率 是指：同一问题编号中回答次数占显示次数的比率。 
#
# 编写一个 SQL 查询以报告 回答率 最高的问题。如果有多个问题具有相同的最大 回答率 ，返回 question_id 最小的那个。 
#
# 查询结果如下例所示。 
#
# 
#
# 示例： 
#
# 
#输入：
#SurveyLog table:
#+----+--------+-------------+-----------+-------+-----------+
#| id | action | question_id | answer_id | q_num | timestamp |
#+----+--------+-------------+-----------+-------+-----------+
#| 5  | show   | 285         | null      | 1     | 123       |
#| 5  | answer | 285         | 124124    | 1     | 124       |
#| 5  | show   | 369         | null      | 2     | 125       |
#| 5  | skip   | 369         | null      | 2     | 126       |
#+----+--------+-------------+-----------+-------+-----------+
#输出：
#+------------+
#| survey_log |
#+------------+
#| 285        |
#+------------+
#解释：
#问题 285 显示 1 次、回答 1 次。回答率为 1.0 。
#问题 369 显示 1 次、回答 0 次。回答率为 0.0 。
#问题 285 回答率最高。 
#
#
# Related Topics 数据库 👍 35 👎 0

public class GetHighestAnswerRateQuestion{
	public static void main(String[] args) {
		Solution solution = new GetHighestAnswerRateQuestion().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select question_id survey_log from
(select question_id,count(if(action='show',id,null)) total,count(if(action='answer',id,null)) answer from SurveyLog group by question_id) a
order by answer/total desc,question_id limit 1

-- select AnswerCnt.question_id as survey_log from
--     (select question_id, count(*) as answer_cnt
--      from SurveyLog
--      where action = "answer"
--      group by question_id) as AnswerCnt
--         join
--     (select question_id, count(*) as action_cnt
--      from SurveyLog
--      where action = "show"
--      group by question_id) as ShowCnt
--     on AnswerCnt.question_id = ShowCnt.question_id
-- order by AnswerCnt.answer_cnt / ShowCnt.action_cnt desc,AnswerCnt.question_id
--     limit 1

-- select question_id as survey_log
-- from SurveyLog
-- group by question_id
-- order by sum(if(action = 'answer', 1, 0)) / sum(if(action = 'show', 1, 0)) desc,question_id
--     limit 1

-- select question_id as survey_log
-- from SurveyLog
-- group by question_id
-- order by avg(action = 'answer') desc,question_id
-- limit 1

-- select question_id as survey_log
-- from SurveyLog
-- group by question_id
-- having sum(action = 'answer')/sum(action = 'show') >= all(select sum(action = 'answer')/sum(action = 'show')
-- from SurveyLog group by question_id)
-- order by question_id limit 1

-- SELECT question_id AS survey_log
-- FROM SurveyLog
-- GROUP BY question_id
-- HAVING SUM(action='answer')/SUM(action='show')>=ALL(
--     SELECT SUM(action='answer')/SUM(action='show')
--     FROM SurveyLog
--     GROUP BY question_id
-- )
-- ORDER BY question_id ASC
--     LIMIT 1


#leetcode submit region end(Prohibit modification and deletion)

}
