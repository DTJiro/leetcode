//给你两棵二叉树： root1 和 root2 。 
//
// 想象一下，当你将其中一棵覆盖到另一棵之上时，两棵树上的一些节点将会重叠（而另一些不会）。你需要将这两棵树合并成一棵新二叉树。合并的规则是：如果两个节点重叠
//，那么将这两个节点的值相加作为合并后节点的新值；否则，不为 null 的节点将直接作为新二叉树的节点。 
//
// 返回合并后的二叉树。 
//
// 注意: 合并过程必须从两个树的根节点开始。 
//
// 
//
// 示例 1： 
// 
// 
//输入：root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]
//输出：[3,4,5,5,4,null,7]
// 
//
// 示例 2： 
//
// 
//输入：root1 = [1], root2 = [1,2]
//输出：[2,2]
// 
//
// 
//
// 提示： 
//
// 
// 两棵树中的节点数目在范围 [0, 2000] 内 
// -10⁴ <= Node.val <= 10⁴ 
// 
//
// Related Topics 树 深度优先搜索 广度优先搜索 二叉树 👍 1406 👎 0


//leetcode submit region begin(Prohibit modification and deletion)

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode right;
 *     TreeNode left;
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
    public TreeNode mergeTrees(TreeNode root1, TreeNode root2) {
        if (root1 == null) {
            return root2;
        }
        if (root2 == null) {
            return root1;
        }
        Queue<TreeNode> q1 = new LinkedList<>();
        Queue<TreeNode> q2 = new LinkedList<>();
        Queue<TreeNode> result = new LinkedList<>();

        q1.offer(root1);
        q2.offer(root2);
        TreeNode r1 = new TreeNode(root1.val + root2.val);
        result.offer(r1);
        while (!q1.isEmpty() && !q2.isEmpty()) {
            TreeNode p1 = q1.poll();
            TreeNode p2 = q2.poll();
            TreeNode r = result.poll();
            if (p1.left != null && p2.left != null) {
                r.left = new TreeNode(p1.left.val + p2.left.val);
                result.offer(r.left);
                q1.offer(p1.left);
                q2.offer(p2.left);
            } else if (p1.left == null) {
                r.left = p2.left;
            } else if (p2.left == null) {
                r.left = p1.left;
            }
            if (p1.right != null && p2.right != null) {
                r.right = new TreeNode(p1.right.val + p2.right.val);
                result.offer(r.right);
                q1.offer(p1.right);
                q2.offer(p2.right);
            } else if (p1.right == null) {
                r.right = p2.right;
            } else if (p2.right == null) {
                r.right = p1.right;
            }

        }

        return r1;
    }

}
//leetcode submit region end(Prohibit modification and deletion)
