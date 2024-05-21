package leetcode.editor.cn;

//给你二叉树的根节点 root ，返回它节点值的 前序 遍历。 
//
// 
//
// 示例 1： 
// 
// 
//输入：root = [1,null,2,3]
//输出：[1,2,3]
// 
//
// 示例 2： 
//
// 
//输入：root = []
//输出：[]
// 
//
// 示例 3： 
//
// 
//输入：root = [1]
//输出：[1]
// 
//
// 示例 4： 
// 
// 
//输入：root = [1,2]
//输出：[1,2]
// 
//
// 示例 5： 
// 
// 
//输入：root = [1,null,2]
//输出：[1,2]
// 
//
// 
//
// 提示： 
//
// 
// 树中节点数目在范围 [0, 100] 内 
// -100 <= Node.val <= 100 
// 
//
// 
//
// 进阶：递归算法很简单，你可以通过迭代算法完成吗？ 
//
// Related Topics 栈 树 深度优先搜索 二叉树 👍 1251 👎 0

import java.util.Collections;
import java.util.LinkedList;
import java.util.PriorityQueue;

public class BinaryTreePreorderTraversal{
	public static void main(String[] args) {
		Solution solution = new BinaryTreePreorderTraversal().new Solution();
		
	}
//leetcode submit region begin(Prohibit modification and deletion)
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public List<Integer> preorderTraversal(TreeNode root) {
		LinkedList<Integer> list = new LinkedList<>();

		TreeNode cur = root;
		TreeNode mid = null;
		while (cur != null) {
			mid = cur.left;
			if (mid != null) {
				while (mid.right != null && mid.right != cur) {
					mid = mid.right;
				}
				if (mid.right == null) {
					list.add(cur.val);
					mid.right = cur;
					cur = cur.left;
					continue;
				} else {
					mid.right = null;
				}
			} else {
				list.add(cur.val);
			}
			cur = cur.right;
		}

		return list;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}
