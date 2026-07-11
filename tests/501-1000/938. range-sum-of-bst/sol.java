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
    public int rangeSumBST(TreeNode root, int low, int high) {
        int[] res = new int[1];
        dfs(root, low, high, res);
        return res[0];
    }
    
    private void dfs(TreeNode node, int low, int high, int[] res) {
        if (node == null) {
            return;
        }
        dfs(node.left, low, high, res);
        if (low <= node.val && node.val <= high) {
            res[0] += node.val;
        }
        dfs(node.right, low, high, res);
    }
}
