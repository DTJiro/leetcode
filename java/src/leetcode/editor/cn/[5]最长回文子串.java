package leetcode.editor.cn;

//给你一个字符串 s，找到 s 中最长的 回文 子串。 
//
// 
//
// 示例 1： 
//
// 
//输入：s = "babad"
//输出："bab"
//解释："aba" 同样是符合题意的答案。
// 
//
// 示例 2： 
//
// 
//输入：s = "cbbd"
//输出："bb"
// 
//
// 
//
// 提示： 
//
// 
// 1 <= s.length <= 1000 
// s 仅由数字和英文字母组成 
// 
//
// Related Topics 双指针 字符串 动态规划 👍 7266 👎 0

public class LongestPalindromicSubstring{
	public static void main(String[] args) {
		Solution solution = new LongestPalindromicSubstring().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public String longestPalindrome(String s) {
		int len = s.length();
		if (len == 1) {
			return s;
		}
		int max = 1;
		int a = 0;
		boolean[][] arr = new boolean[len][len];
		for (int i = 0; i < len; i++) {
			arr[i][i] = true;
		}
		for (int j = 1; j < len; j++) {
			for (int i = 0; i < j; i++) {
				if (s.charAt(i) != s.charAt(j)) {
					arr[i][j] = false;
				} else {
					if (j - i < 3) {
						arr[i][j] = true;
					} else {
						arr[i][j] = arr[i + 1][j - 1];
					}
				}

				if (arr[i][j] && j - i + 1 > max) {
					max = j - i + 1;
					a = i;
				}
			}
		}
		return s.substring(a, a + max);
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}
