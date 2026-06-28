/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public int val;
 *     public TreeNode left;
 *     public TreeNode right;
 *     public TreeNode(int val=0, TreeNode left=null, TreeNode right=null) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
public class Solution {
    public int DiameterOfBinaryTree(TreeNode root) {
        return diameter(root);
    }
    
    private int height(TreeNode node) {
        if (node == null) return 0;
        return 1 + Math.Max(height(node.left), height(node.right));
    }
    
    private int diameter(TreeNode node) {
        if (node == null) return 0;
        int diameterThroughNode = height(node.left) + height(node.right);
        int leftDiameter = diameter(node.left);
        int rightDiameter = diameter(node.right);
        return Math.Max(diameterThroughNode, Math.Max(leftDiameter, rightDiameter));
    }
}
