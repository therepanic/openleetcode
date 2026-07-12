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
    private int moves = 0;
    
    public int distributeCoins(TreeNode root) {
        solve(root);
        return moves;
    }
    
    private int solve(TreeNode node) {
        if (node == null) return 0;
        int leftCandie = solve(node.left);
        int rightCandie = solve(node.right);
        moves += Math.abs(leftCandie) + Math.abs(rightCandie);
        return (leftCandie + rightCandie + node.val) - 1;
    }
}
