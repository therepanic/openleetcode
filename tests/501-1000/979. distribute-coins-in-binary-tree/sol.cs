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
    private int moves = 0;
    
    public int DistributeCoins(TreeNode root) {
        Solve(root);
        return moves;
    }
    
    private int Solve(TreeNode node) {
        if (node == null) return 0;
        int leftCandie = Solve(node.left);
        int rightCandie = Solve(node.right);
        moves += Math.Abs(leftCandie) + Math.Abs(rightCandie);
        return (leftCandie + rightCandie + node.val) - 1;
    }
}
