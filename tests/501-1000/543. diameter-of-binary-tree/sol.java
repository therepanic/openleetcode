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
    public int diameterOfBinaryTree(TreeNode root) {
        return diameter(root);
    }
    
    private int height(TreeNode node) {
        if (node == null) {
            return 0;
        }
        return 1 + Math.max(height(node.left), height(node.right));
    }
    
    private int diameter(TreeNode node) {
        if (node == null) {
            return 0;
        }
        int diameterThroughNode = height(node.left) + height(node.right);
        int leftDiameter = diameter(node.left);
        int rightDiameter = diameter(node.right);
        return Math.max(diameterThroughNode, Math.max(leftDiameter, rightDiameter));
    }
}
