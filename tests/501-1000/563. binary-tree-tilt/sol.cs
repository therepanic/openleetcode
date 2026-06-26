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
    private int ans;
    public int FindTilt(TreeNode root) {
        ans = 0;
        Helper(root);
        return ans;
    }
    private int Helper(TreeNode n) {
        if (n == null) return 0;
        int l = Helper(n.left);
        int r = Helper(n.right);
        ans += Math.Abs(l - r);
        return l + r + n.val;
    }
}
