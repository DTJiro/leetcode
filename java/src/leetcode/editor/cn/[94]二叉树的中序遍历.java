package leetcode.editor.cn;

//给定一个二叉树的根节点 root ，返回 它的 中序 遍历 。 
//
// 
//
// 示例 1： 
// 
// 
//输入：root = [1,null,2,3]
//输出：[1,3,2]
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
// 进阶: 递归算法很简单，你可以通过迭代算法完成吗？ 
//
// Related Topics 栈 树 深度优先搜索 二叉树 👍 2082 👎 0

import java.util.ArrayList;
import java.util.Deque;
import java.util.LinkedList;
import java.util.List;

public class BinaryTreeInorderTraversal{
	public static void main(String[] args) {
		Solution solution = new BinaryTreeInorderTraversal().new Solution();
		
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
    public List<Integer> inorderTraversal(TreeNode root) {
		List<Integer> list = new ArrayList<>();

		while (root != null) {
			if (root.left != null) {
				TreeNode p = root.left;
				while (p.right != null && p.right != root) {
					p = p.right;
				}
				if (p.right == null) {
					p.right = root;
					root = root.left;
				} else {
					p.right = null;
					list.add(root.val);
					root = root.right;
				}
			} else {
				list.add(root.val);
				root = root.right;
			}

		}
		return list;
	}

}
//leetcode submit region end(Prohibit modification and deletion)

}
