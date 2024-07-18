//数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。 
//
// 
//
// 示例 1： 
//
// 
//输入：n = 3
//输出：["((()))","(()())","(())()","()(())","()()()"]
// 
//
// 示例 2： 
//
// 
//输入：n = 1
//输出：["()"]
// 
//
// 
//
// 提示： 
//
// 
// 1 <= n <= 8 
// 
//
// Related Topics 字符串 动态规划 回溯 👍 3619 👎 0


import com.sun.org.apache.xpath.internal.operations.String;

import java.util.ArrayList;
import java.util.Arrays;

//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public List<String> generateParenthesis(int n) {
        List<String> res = new ArrayList<>();
        a(res, new StringBuilder(), 0, 0, n);

        return res;
    }

    void a(List<String> list, StringBuilder sb, int i, int j, int n) {
        if (sb.length() == n * 2) {
            list.add(sb.toString());
            return;
        }
        if (i < n) {
            sb.append("(");
            a(list, sb, i + 1, j, n);
            sb.deleteCharAt(sb.length() - 1);
        }
        if (j < i) {
            sb.append(")");
            a(list, sb, i, j + 1, n);
            sb.deleteCharAt(sb.length() - 1);
        }
    }
}
//leetcode submit region end(Prohibit modification and deletion)
