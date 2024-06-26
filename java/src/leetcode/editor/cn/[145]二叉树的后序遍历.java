package leetcode.editor.cn;

//给你一棵二叉树的根节点 root ，返回其节点值的 后序遍历 。 
//
// 
//
// 示例 1： 
// 
// 
//输入：root = [1,null,2,3]
//输出：[3,2,1]
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
// 树中节点的数目在范围 [0, 100] 内 
// -100 <= Node.val <= 100 
// 
//
// 
//
// 进阶：递归算法很简单，你可以通过迭代算法完成吗？ 
//
// Related Topics 栈 树 深度优先搜索 二叉树 👍 1176 👎 0

import java.util.ArrayList;
import java.util.LinkedList;

public class BinaryTreePostorderTraversal{
	public static void main(String[] args) {
		Solution solution = new BinaryTreePostorderTraversal().new Solution();
		
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
    public List<Integer> postorderTraversal(TreeNode root) {
		ArrayList<Integer> list = new ArrayList<>();

		TreeNode cur = root;
		TreeNode mid;
		while (cur != null) {
			mid = cur.left;
			if (mid != null) {
				while (mid.right != null && mid.right != cur) {
					mid = mid.right;
				}
				if (mid.right == null) {
					mid.right = cur;
					cur = cur.left;
					continue;
				} else {
					mid.right = null;
					a(list, cur.left);
				}
			}
			cur = cur.right;
		}
		a(list,root);

		return list;
	}

	public void a(List<Integer> list, TreeNode a) {
		TreeNode pre = null;
		TreeNode next = null;
		while (a != null) {
			pre = a.right;
			a.right = next;
			next = a;
			a = pre;
		}
		while (next != null) {
			list.add(next.val);
			next = next.right;
		}
	}

}
//leetcode submit region end(Prohibit modification and deletion)

}
