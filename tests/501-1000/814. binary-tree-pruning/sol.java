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
    public TreeNode pruneTree(TreeNode root) {
        traverseAndRemove(root);
        if (root.left == null && root.right == null && root.val == 0) {
            return null;
        }
        return root;
    }
    
    private boolean traverseAndRemove(TreeNode temp) {
        if (temp == null) {
            return false;
        }
        if (temp.left == null && temp.right == null) {
            return temp.val == 1;
        }
        boolean left = traverseAndRemove(temp.left);
        boolean right = traverseAndRemove(temp.right);
        if (!left) {
            temp.left = null;
        }
        if (!right) {
            temp.right = null;
        }
        return left || right || temp.val == 1;
    }
}
