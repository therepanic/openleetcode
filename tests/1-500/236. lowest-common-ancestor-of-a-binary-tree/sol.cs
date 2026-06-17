/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public int val;
 *     public TreeNode left;
 *     public TreeNode right;
 *     public TreeNode(int x) { val = x; }
 * }
 */
public class Solution {
    public TreeNode LowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        if (root == null) {
            return null;
        }

        int pVal = p != null ? p.val : -1;
        int qVal = q != null ? q.val : -1;
        if (root.val == pVal || root.val == qVal) {
            return root;
        }

        TreeNode left = LowestCommonAncestor(root.left, p, q);
        TreeNode right = LowestCommonAncestor(root.right, p, q);

        if (left != null && right != null) {
            return root;
        }

        return left ?? right;
    }
}
