package leetcode.editor.cn;

//给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。 
//
// 有效字符串需满足： 
//
// 
// 左括号必须用相同类型的右括号闭合。 
// 左括号必须以正确的顺序闭合。 
// 每个右括号都有一个对应的相同类型的左括号。 
// 
//
// 
//
// 示例 1： 
//
// 
//输入：s = "()"
//输出：true
// 
//
// 示例 2： 
//
// 
//输入：s = "()[]{}"
//输出：true
// 
//
// 示例 3： 
//
// 
//输入：s = "(]"
//输出：false
// 
//
// 
//
// 提示： 
//
// 
// 1 <= s.length <= 10⁴ 
// s 仅由括号 '()[]{}' 组成 
// 
//
// Related Topics 栈 字符串 👍 4419 👎 0

import java.util.HashMap;
import java.util.LinkedList;

public class ValidParentheses{
	public static void main(String[] args) {
		Solution solution = new ValidParentheses().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public boolean isValid(String s) {

		// if (s.length() % 2 == 1) {
		// 	return false;
		// }
		// Deque<Character> stack = new LinkedList<>();
		// for (char c : s.toCharArray()) {
		// 	if (c == '(') {
		// 		stack.push(')');
		// 	} else if (c == '{') {
		// 		stack.push('}');
		// 	} else if (c == '[') {
		// 		stack.push(']');
		// 	} else {
		// 		if (stack.isEmpty() || c != stack.pop()) {
		// 			return false;
		// 		}
		// 	}
		// }
		// return stack.isEmpty();

		Map<Character, Character> map = new HashMap<>(3){
			{
				put(')', '(');
				put('}', '{');
				put(']', '[');
			}
		};
		Deque<Character> stack = new LinkedList<>();
		for (char c : s.toCharArray()) {
			if (map.containsKey(c)) {
				if (stack.isEmpty() || !map.get(c).equals(stack.pop())) {
					return false;
				}
			} else {
				stack.push(c);
			}
		}
		return stack.isEmpty();
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}
