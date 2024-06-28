package leetcode.editor.cn;

//给你一个二叉树的根节点 root ， 检查它是否轴对称。 
//
// 
//
// 示例 1： 
// 
// 
//输入：root = [1,2,2,3,4,4,3]
//输出：true
// 
//
// 示例 2： 
// 
// 
//输入：root = [1,2,2,null,3,null,3]
//输出：false
// 
//
// 
//
// 提示： 
//
// 
// 树中节点数目在范围 [1, 1000] 内 
// -100 <= Node.val <= 100 
// 
//
// 
//
// 进阶：你可以运用递归和迭代两种方法解决这个问题吗？ 
//
// Related Topics 树 深度优先搜索 广度优先搜索 二叉树 👍 2715 👎 0

import java.util.LinkedList;
import java.util.Queue;

public class SymmetricTree{
	public static void main(String[] args) {
		Solution solution = new SymmetricTree().new Solution();
		
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
    public boolean isSymmetric(TreeNode root) {
		return root == null || t(root.left, root.right);
    }

	boolean t(TreeNode p, TreeNode q) {
		Queue<TreeNode> list = new LinkedList<TreeNode>();
		list.offer(p);
		list.offer(q);

		while (!list.isEmpty()) {
			TreeNode a = list.poll();
			TreeNode b = list.poll();

			if (a == null && b == null) {
				continue;
			}
			if ((a == null || b == null) || a.val != b.val) {
				return false;
			}

			list.offer(a.left);
			list.offer(b.right);

			list.offer(a.right);
			list.offer(b.left);
		}
		return true;
	}
}
//leetcode submit region end(Prohibit modification and deletion)

}
