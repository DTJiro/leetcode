package leetcode.editor.cn;

//给你一棵二叉树的根节点 root ，翻转这棵二叉树，并返回其根节点。 
//
// 
//
// 示例 1： 
//
// 
//
// 
//输入：root = [4,2,7,1,3,6,9]
//输出：[4,7,2,9,6,3,1]
// 
//
// 示例 2： 
//
// 
//
// 
//输入：root = [2,1,3]
//输出：[2,3,1]
// 
//
// 示例 3： 
//
// 
//输入：root = []
//输出：[]
// 
//
// 
//
// 提示： 
//
// 
// 树中节点数目范围在 [0, 100] 内 
// -100 <= Node.val <= 100 
// 
//
// Related Topics 树 深度优先搜索 广度优先搜索 二叉树 👍 1807 👎 0

import java.util.LinkedList;

public class InvertBinaryTree{
	public static void main(String[] args) {
		Solution solution = new InvertBinaryTree().new Solution();
		
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
    public TreeNode invertTree(TreeNode root) {
		if (root == null) {
			return null;
		}
		Queue<TreeNode> list = new LinkedList<TreeNode>();
		list.offer(root);
		while (!list.isEmpty()) {
			int size = list.size();
			for (int i = 0; i < size; i++) {
				TreeNode p = list.poll();
				if (p.left != null) {
					list.offer(p.left);
				}
				if (p.right != null) {
					list.offer(p.right);
				}
				TreeNode t = p.left;
				p.left = p.right;
				p.right = t;
			}
		}
		return root;
	}

}
//leetcode submit region end(Prohibit modification and deletion)

}
