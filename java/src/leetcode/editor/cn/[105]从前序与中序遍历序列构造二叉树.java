package leetcode.editor.cn;

//给定两个整数数组 preorder 和 inorder ，其中 preorder 是二叉树的先序遍历， inorder 是同一棵树的中序遍历，请构造二叉树并
//返回其根节点。 
//
// 
//
// 示例 1: 
// 
// 
//输入: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
//输出: [3,9,20,null,null,15,7]
// 
//
// 示例 2: 
//
// 
//输入: preorder = [-1], inorder = [-1]
//输出: [-1]
// 
//
// 
//
// 提示: 
//
// 
// 1 <= preorder.length <= 3000 
// inorder.length == preorder.length 
// -3000 <= preorder[i], inorder[i] <= 3000 
// preorder 和 inorder 均 无重复 元素 
// inorder 均出现在 preorder 
// preorder 保证 为二叉树的前序遍历序列 
// inorder 保证 为二叉树的中序遍历序列 
// 
//
// Related Topics 树 数组 哈希表 分治 二叉树 👍 2308 👎 0

import java.util.Arrays;

public class ConstructBinaryTreeFromPreorderAndInorderTraversal{
	public static void main(String[] args) {
		Solution solution = new ConstructBinaryTreeFromPreorderAndInorderTraversal().new Solution();

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

    public TreeNode buildTree(int[] preorder, int[] inorder) {
        int preRight = preorder.length;
        int inRight = inorder.length;
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < inRight; i++) {
            map.put(inorder[i], i);
        }
        return a(preorder, 0, preRight - 1, map, 0, inRight - 1);
    }

    TreeNode a(int[] preorder, int preLeft, int preRight, Map<Integer, Integer> map, int inLeft, int inRight) {
        if (preLeft > preRight || inLeft > inRight) {
            return null;
        }
        TreeNode root = new TreeNode(preorder[preLeft]);
        Integer index = map.get(preorder[preLeft]);

        root.left = a(preorder, preLeft + 1, preLeft + index - inLeft,
                map, inLeft, index - 1);
        root.right = a(preorder, preLeft + index - inLeft + 1, preRight,
                map, index + 1, inRight);

        return root;
    }

}
//leetcode submit region end(Prohibit modification and deletion)

}
