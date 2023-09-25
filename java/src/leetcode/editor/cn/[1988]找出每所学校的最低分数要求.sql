package leetcode.editor.cn;

#表： Schools 
#
# 
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| school_id   | int  |
#| capacity    | int  |
#+-------------+------+
#school_id 是该表具有唯一值的列。
#此表包含了一些学校的容纳能力。容纳能力指的是学校能够接纳学生的最大数量。
# 
#
# 
#
# 表： Exam 
#
# 
#+---------------+------+
#| Column Name   | Type |
#+---------------+------+
#| score         | int  |
#| student_count | int  |
#+---------------+------+
#score 是该表具有唯一值的列。
#表中每一行表示有 student_count 名学生在考试中至少获得了 score 分。
#表中的数据在逻辑上是正确的，即记录了高 score 的行相比记录了低 score 的行拥有相同或更少的 student_count。也就是说，对于表中的 i 
#行与 j 行，如果 scorei > scorej，那么 student_counti <= student_countj
# 
#
# 每年，学校会公布学生申请所需的最低分数要求。学校根据所有学生的考试成绩来决定其最低分数要求。 
#
# 
# 学校希望确保即使 每 一个满足分数要求的学生都申请该学校，学校也有足够的能力接纳每一个学生。 
# 学校也希望 尽可能多 的学生能申请该学校。 
# 学校 必须 使用在 Exam 表中的 score 来作为最低分数要求。 
# 
#
# 编写一个解决方案，报告每所学校的 最低分数要求。如果同时有多个 score 值满足上述要求，则选择其中 最小的一个。如果数据不足以决定 最低分数要求，那么输
#出 -1。 
#
# 返回的结果表可以按 任意顺序 排序。 
#
# 结果格式如下例所示： 
#
# 
#
# 示例 1： 
#
# 
#输入:
#Schools 表:
#+-----------+----------+
#| school_id | capacity |
#+-----------+----------+
#| 11        | 151      |
#| 5         | 48       |
#| 9         | 9        |
#| 10        | 99       |
#+-----------+----------+
#Exam 表:
#+-------+---------------+
#| score | student_count |
#+-------+---------------+
#| 975   | 10            |
#| 966   | 60            |
#| 844   | 76            |
#| 749   | 76            |
#| 744   | 100           |
#+-------+---------------+
#输出:
#+-----------+-------+
#| school_id | score |
#+-----------+-------+
#| 5         | 975   |
#| 9         | -1    |
#| 10        | 749   |
#| 11        | 744   |
#+-----------+-------+
#解释： 
#- School 5：学校的容纳能力为 48 。选择 975 作为最低分数要求，因为学校最多会收到 10 份申请，这在学校的容纳能力以内。
#- School 10：学校的容纳能力为 99 。可以选择 844 或 749 作为最低分数要求，因为学校最多会收到 76 份申请，这在学校的容纳能力以内。又
#因为 749 是所有可选项中最小的，因此我们选择 749 。
#- School 11：学校的容纳能力为 151 。选择 744 作为最低分数要求，因为学校最多会收到 100 份申请，这在学校的容纳能力以内。
#- School 9：给出的数据不足以确定最低分数要求。如果选择 975 作为最低分数要求，学校可能会收到 10 份申请，然而学校的容纳能力只有 9 。我们没
#有关于更高分数的信息，因此我们返回 -1 。
# 
#
# Related Topics 数据库 👍 18 👎 0

public class FindCutoffScoreForEachSchool{
	public static void main(String[] args) {
		Solution solution = new FindCutoffScoreForEachSchool().new Solution();
		
	}
#leetcode submit region begin(Prohibit modification and deletion)
# Write your MySQL query statement below

select a.school_id,ifnull(min(b.score),-1) score from Schools a left join Exam b on a.capacity>=b.student_count
group by a.school_id

#leetcode submit region end(Prohibit modification and deletion)

}
