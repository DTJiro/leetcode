package leetcode.editor.cn;

//给定两个整数数组 inorder 和 postorder ，其中 inorder 是二叉树的中序遍历， postorder 是同一棵树的后序遍历，请你构造并
//返回这颗 二叉树 。 
//
// 
//
// 示例 1: 
// 
// 
//输入：inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
//输出：[3,9,20,null,null,15,7]
// 
//
// 示例 2: 
//
// 
//输入：inorder = [-1], postorder = [-1]
//输出：[-1]
// 
//
// 
//
// 提示: 
//
// 
// 1 <= inorder.length <= 3000 
// postorder.length == inorder.length 
// -3000 <= inorder[i], postorder[i] <= 3000 
// inorder 和 postorder 都由 不同 的值组成 
// postorder 中每一个值都在 inorder 中 
// inorder 保证是树的中序遍历 
// postorder 保证是树的后序遍历 
// 
//
// Related Topics 树 数组 哈希表 分治 二叉树 👍 1230 👎 0

import java.util.Arrays;

public class ConstructBinaryTreeFromInorderAndPostorderTraversal{
	public static void main(String[] args) {
		Solution solution = new ConstructBinaryTreeFromInorderAndPostorderTraversal().new Solution();
		
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
    public TreeNode buildTree(int[] inorder, int[] postorder) {
		if (inorder.length == 0) {
			return null;
		}

		int size = postorder.length - 1;

		TreeNode root = new TreeNode(postorder[size]);
		int i = 0;
		for (; inorder[i] != postorder[size]; i++) ;

		int[] left1 = Arrays.copyOfRange(inorder, 0, i);
		int[] right1 = Arrays.copyOfRange(inorder, i + 1, inorder.length);

		int[] left2 = Arrays.copyOfRange(postorder, 0, i);
		int[] right2 = Arrays.copyOfRange(postorder, i, size);

		root.left = buildTree(left1, left2);
		root.right = buildTree(right1, right2);

		return root;
    }
}
//leetcode submit region end(Prohibit modification and deletion)

}
