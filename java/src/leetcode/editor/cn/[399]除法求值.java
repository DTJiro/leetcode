package leetcode.editor.cn;

//给你一个变量对数组 equations 和一个实数值数组 values 作为已知条件，其中 equations[i] = [Ai, Bi] 和 
//values[i] 共同表示等式 Ai / Bi = values[i] 。每个 Ai 或 Bi 是一个表示单个变量的字符串。 
//
// 另有一些以数组 queries 表示的问题，其中 queries[j] = [Cj, Dj] 表示第 j 个问题，请你根据已知条件找出 Cj / Dj =
// ? 的结果作为答案。 
//
// 返回 所有问题的答案 。如果存在某个无法确定的答案，则用 -1.0 替代这个答案。如果问题中出现了给定的已知条件中没有出现的字符串，也需要用 -1.0 替
//代这个答案。 
//
// 注意：输入总是有效的。你可以假设除法运算中不会出现除数为 0 的情况，且不存在任何矛盾的结果。 
//
// 注意：未在等式列表中出现的变量是未定义的，因此无法确定它们的答案。 
//
// 
//
// 示例 1： 
//
// 
//输入：equations = [["a","b"],["b","c"]], values = [2.0,3.0], queries = [["a","c"]
//,["b","a"],["a","e"],["a","a"],["x","x"]]
//输出：[6.00000,0.50000,-1.00000,1.00000,-1.00000]
//解释：
//条件：a / b = 2.0, b / c = 3.0
//问题：a / c = ?, b / a = ?, a / e = ?, a / a = ?, x / x = ?
//结果：[6.0, 0.5, -1.0, 1.0, -1.0 ]
//注意：x 是未定义的 => -1.0 
//
// 示例 2： 
//
// 
//输入：equations = [["a","b"],["b","c"],["bc","cd"]], values = [1.5,2.5,5.0], 
//queries = [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]
//输出：[3.75000,0.40000,5.00000,0.20000]
// 
//
// 示例 3： 
//
// 
//输入：equations = [["a","b"]], values = [0.5], queries = [["a","b"],["b","a"],[
//"a","c"],["x","y"]]
//输出：[0.50000,2.00000,-1.00000,-1.00000]
// 
//
// 
//
// 提示： 
//
// 
// 1 <= equations.length <= 20 
// equations[i].length == 2 
// 1 <= Ai.length, Bi.length <= 5 
// values.length == equations.length 
// 0.0 < values[i] <= 20.0 
// 1 <= queries.length <= 20 
// queries[i].length == 2 
// 1 <= Cj.length, Dj.length <= 5 
// Ai, Bi, Cj, Dj 由小写英文字母与数字组成 
// 
//
// Related Topics 深度优先搜索 广度优先搜索 并查集 图 数组 字符串 最短路 👍 1121 👎 0

import com.ttran.nbbus.Trie;

import java.util.Map;

public class EvaluateDivision{
	public static void main(String[] args) {
		Solution solution = new EvaluateDivision().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
class Solution {
    public double[] calcEquation(List<List<String>> equations, double[] values, List<List<String>> queries) {
		int size = equations.size();
		Trie trie = new Trie(2 * size);

		Map<String, Integer> map = new HashMap<>(2 * size);
		int id = 0;
		for (int i = 0; i < size; i++) {
			List<String> list = equations.get(i);
			String s1 = list.get(0);
			String s2 = list.get(1);
			if (!map.containsKey(s1)) {
				map.put(s1, id++);
			}
			if (!map.containsKey(s2)) {
				map.put(s2, id++);
			}
			trie.union(map.get(s1), map.get(s2), values[i]);
		}

		int size1 = queries.size();
		double[] res = new double[size1];
		for (int i = 0; i < size1; i++) {
			List<String> list = queries.get(i);
			String s1 = list.get(0);
			String s2 = list.get(1);

			Integer i1 = map.get(s1);
			Integer i2 = map.get(s2);
			if (i1 == null || i2 == null) {
				res[i] = -1.0;
			} else {
				res[i] = trie.isConnected(i1, i2);
			}
		}
		return res;
    }
}

	class Trie {

		private int[] parent;
		private double[] weight;

		public Trie(int n) {
			parent = new int[n];
			weight = new double[n];
			for (int i = 0; i < n; i++) {
				parent[i] = i;
				weight[i] = 1.0;
			}
		}

		public void union(int i, int j, double k) {
			int x = find(i);
			int y = find(j);
			if (x == y) {
				return;
			}
			parent[x] = y;
			weight[x] = weight[j] * k / weight[i];
		}

		public double isConnected(int i, int j) {
			int x = find(i);
			int y = find(j);
			if (x == y) {
				return weight[i] / weight[j];
			} else {
				return -1.0;
			}
		}

		public int find(int i) {
			if (i != parent[i]) {
				int n = parent[i];
				parent[i] = find(parent[i]);
				weight[i] *= weight[n];
			}
			return parent[i];
		}
	}
//leetcode submit region end(Prohibit modification and deletion)

}
