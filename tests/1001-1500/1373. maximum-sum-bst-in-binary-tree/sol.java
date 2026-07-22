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
    private int best = 0;
    
    public int maxSumBST(TreeNode root) {
        best = 0;
        dfs(root);
        return best;
    }
    
    private int[] dfs(TreeNode node) {
        if (node == null) {
            return new int[]{1, Integer.MAX_VALUE, Integer.MIN_VALUE, 0};
        }
        
        int[] left = dfs(node.left);
        int[] right = dfs(node.right);
        
        int lbst = left[0], lmin = left[1], lmax = left[2], lsum = left[3];
        int rbst = right[0], rmin = right[1], rmax = right[2], rsum = right[3];
        
        if (lbst == 1 && rbst == 1 && lmax < node.val && node.val < rmin) {
            int total = lsum + rsum + node.val;
            best = Math.max(best, total);
            int newMin = Math.min(lmin, node.val);
            int newMax = Math.max(rmax, node.val);
            return new int[]{1, newMin, newMax, total};
        }
        
        return new int[]{0, Integer.MIN_VALUE, Integer.MAX_VALUE, 0};
    }
}
