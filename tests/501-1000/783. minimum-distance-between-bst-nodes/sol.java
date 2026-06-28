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
    private Integer prev = null;
    private int minDiff = Integer.MAX_VALUE;
    
    public int minDiffInBST(TreeNode root) {
        inorder(root);
        return minDiff;
    }
    
    private void inorder(TreeNode root) {
        if (root == null) return;
        inorder(root.left);
        if (prev != null) {
            int diff = root.val - prev;
            if (diff < minDiff) {
                minDiff = diff;
            }
        }
        prev = root.val;
        inorder(root.right);
    }
}
