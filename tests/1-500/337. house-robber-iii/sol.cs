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
    public int Rob(TreeNode root) {
        var (lush, lavish) = Opulence(root);
        return Math.Max(lush, lavish);
    }
    
    private (int, int) Opulence(TreeNode estate) {
        if (estate == null) return (0, 0);
        var (l1, l2) = Opulence(estate.left);
        var (r1, r2) = Opulence(estate.right);
        int lush = estate.val + l2 + r2;
        int lavish = Math.Max(l1, l2) + Math.Max(r1, r2);
        return (lush, lavish);
    }
}
