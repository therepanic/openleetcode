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
    public int minCameraCover(TreeNode root) {
        return dfs(root) + (root.val == 0 ? 1 : 0);
    }
    
    private int dfs(TreeNode node) {
        if (node == null) return 0;
        int res = dfs(node.left) + dfs(node.right);
        int curr = Math.min(
            node.left != null ? node.left.val : Integer.MAX_VALUE,
            node.right != null ? node.right.val : Integer.MAX_VALUE
        );
        if (curr == 0) {
            node.val = 1;
            res += 1;
        } else if (curr == 1) {
            node.val = 2;
        }
        return res;
    }
}
