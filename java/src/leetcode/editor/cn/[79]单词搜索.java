package leetcode.editor.cn;

//给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。 
//
// 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。 
//
// 
//
// 示例 1： 
// 
// 
//输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = 
//"ABCCED"
//输出：true
// 
//
// 示例 2： 
// 
// 
//输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = 
//"SEE"
//输出：true
// 
//
// 示例 3： 
// 
// 
//输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = 
//"ABCB"
//输出：false
// 
//
// 
//
// 提示： 
//
// 
// m == board.length 
// n = board[i].length 
// 1 <= m, n <= 6 
// 1 <= word.length <= 15 
// board 和 word 仅由大小写英文字母组成 
// 
//
// 
//
// 进阶：你可以使用搜索剪枝的技术来优化解决方案，使其在 board 更大的情况下可以更快解决问题？ 
//
// Related Topics 数组 字符串 回溯 矩阵 👍 1845 👎 0

public class WordSearch{
	public static void main(String[] args) {
		Solution solution = new WordSearch().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public boolean exist(char[][] board, String word) {
		int m = board.length;
		int n = board[0].length;
		boolean[][] b = new boolean[m][n];
		for (int i = 0; i < m; i++) {
			for (int j = 0; j < n; j++) {
				boolean flag = a(board, b, i, j, word, 0);
				if(flag){
					return true;
				}
			}
		}
		return false;
	}

	boolean a(char[][] board, boolean[][] b, int i, int j, String word, int k) {
		if (board[i][j] != word.charAt(k)) {
			return false;
		}else if (k == word.length() - 1) {
			return true;
		}
		b[i][j] = true;
		int[][] arr = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}};
		boolean flag = false;
		for (int[] ints : arr) {
			int p = i + ints[0];
			int q = j + ints[1];
			if (0 <= p && p < board.length && 0 <= q && q < board[0].length) {
				if (!b[p][q]) {
					boolean f = a(board, b, p, q, word, k + 1);
					if (f) {
						flag = true;
						break;
					}
				}
			}
		}
		b[i][j] = false;

		return flag;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}
