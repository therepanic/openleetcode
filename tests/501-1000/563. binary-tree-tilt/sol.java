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
    private int ans;
    public int findTilt(TreeNode root) {
        ans = 0;
        helper(root);
        return ans;
    }
    private int helper(TreeNode n) {
        if (n == null) return 0;
        int l = helper(n.left);
        int r = helper(n.right);
        ans += Math.abs(l - r);
        return l + r + n.val;
    }
}
