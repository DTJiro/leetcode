package leetcode.editor.cn;

//给定两个字符串 s 和 p，找到 s 中所有 p 的 异位词 的子串，返回这些子串的起始索引。不考虑答案输出的顺序。 
//
// 
//
// 示例 1: 
//
// 
//输入: s = "cbaebabacd", p = "abc"
//输出: [0,6]
//解释:
//起始索引等于 0 的子串是 "cba", 它是 "abc" 的异位词。
//起始索引等于 6 的子串是 "bac", 它是 "abc" 的异位词。
// 
//
// 示例 2: 
//
// 
//输入: s = "abab", p = "ab"
//输出: [0,1,2]
//解释:
//起始索引等于 0 的子串是 "ab", 它是 "ab" 的异位词。
//起始索引等于 1 的子串是 "ba", 它是 "ab" 的异位词。
//起始索引等于 2 的子串是 "ab", 它是 "ab" 的异位词。
// 
//
// 
//
// 提示: 
//
// 
// 1 <= s.length, p.length <= 3 * 10⁴ 
// s 和 p 仅包含小写字母 
// 
//
// Related Topics 哈希表 字符串 滑动窗口 👍 1521 👎 0

public class FindAllAnagramsInAString{
	public static void main(String[] args) {
		Solution solution = new FindAllAnagramsInAString().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public List<Integer> findAnagrams(String s, String p) {
		List<Integer> list = new ArrayList<>();
		if (s.length() < p.length()) {
			return list;
		}

		int[] a = new int[26];
		for (int i = 0; i < p.length(); i++) {
			a[s.charAt(i) - 'a']++;
			a[p.charAt(i) - 'a']--;
		}
		int diff = 0;
		for (int i = 0; i < 26; i++) {
			if (a[i] != 0) {
				diff++;
			}
		}
		if (diff == 0) {
			list.add(0);
		}
		for (int i = 0; i < s.length() - p.length(); i++) {
			if (a[s.charAt(i) - 'a'] == 1) {
				diff--;
			} else if (a[s.charAt(i) - 'a'] == 0) {
				diff++;
			}
			a[s.charAt(i) - 'a']--;
			if (a[s.charAt(i + p.length()) - 'a'] == -1) {
				diff--;
			} else if (a[s.charAt(i + p.length()) - 'a'] == 0) {
				diff++;
			}
			a[s.charAt(i + p.length()) - 'a']++;
			if (diff == 0) {
				list.add(i + 1);
			}
		}
		return list;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}
