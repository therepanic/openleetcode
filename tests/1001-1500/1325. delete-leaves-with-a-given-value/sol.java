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
    public TreeNode removeLeafNodes(TreeNode root, int target) {
        if (!traverseAndRemove(root, target)) {
            return null;
        }
        return root;
    }
    
    private boolean traverseAndRemove(TreeNode temp, int target) {
        if (temp == null) {
            return false;
        }
        if (temp.left == null && temp.right == null) {
            return temp.val != target;
        }
        boolean left = traverseAndRemove(temp.left, target);
        boolean right = traverseAndRemove(temp.right, target);
        if (!left) {
            temp.left = null;
        }
        if (!right) {
            temp.right = null;
        }
        return left || right || temp.val != target;
    }
}
