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
    private int ans = 0;
    
    private int Solve(TreeNode node) {
        if (node == null) return 0;
        int left = Solve(node.left);
        int right = Solve(node.right);
        int leftPath = 0;
        int rightPath = 0;
        if (node.left != null && node.left.val == node.val) {
            leftPath = left + 1;
        }
        if (node.right != null && node.right.val == node.val) {
            rightPath = right + 1;
        }
        ans = Math.Max(ans, leftPath + rightPath);
        return Math.Max(leftPath, rightPath);
    }
    
    public int LongestUnivaluePath(TreeNode root) {
        ans = 0;
        Solve(root);
        return ans;
    }
}
