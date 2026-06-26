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
    private int? prev = null;
    private int ans = int.MaxValue;

    public int GetMinimumDifference(TreeNode root) {
        dfs(root);
        return ans;
    }

    private void dfs(TreeNode node) {
        if (node == null) return;
        dfs(node.left);
        if (prev.HasValue) {
            ans = Math.Min(ans, node.val - prev.Value);
        }
        prev = node.val;
        dfs(node.right);
    }
}
