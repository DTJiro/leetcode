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
        if (n == 1) {
            return Arrays.asList("()");
        }
        if (n == 2) {
            return Arrays.asList("(())", "()()");
        }
        List<String> list = generateParenthesis(--n);
        List<String> res = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            res.add("(" + list.get(i) + ")");
            res.add("()" + list.get(i));
            if (i != list.size() - 1) {
                res.add(list.get(i) + "()");
            }
        }

        return res;
    }
}
//leetcode submit region end(Prohibit modification and deletion)
