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
    private int best = 0;
    
    public int MaxSumBST(TreeNode root) {
        best = 0;
        dfs(root);
        return best;
    }
    
    private (bool, int, int, int) dfs(TreeNode node) {
        if (node == null) {
            return (true, int.MaxValue, int.MinValue, 0);
        }
        
        var (lbst, lmin, lmax, lsum) = dfs(node.left);
        var (rbst, rmin, rmax, rsum) = dfs(node.right);
        
        if (lbst && rbst && lmax < node.val && node.val < rmin) {
            int total = lsum + rsum + node.val;
            best = Math.Max(best, total);
            int newMin = Math.Min(lmin, node.val);
            int newMax = Math.Max(rmax, node.val);
            return (true, newMin, newMax, total);
        }
        
        return (false, int.MinValue, int.MaxValue, 0);
    }
}
