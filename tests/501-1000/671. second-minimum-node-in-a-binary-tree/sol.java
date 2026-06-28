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
    private long second = Long.MAX_VALUE;
    private int first;
    
    public int findSecondMinimumValue(TreeNode root) {
        first = root.val;
        dfs(root);
        return second == Long.MAX_VALUE ? -1 : (int) second;
    }
    
    private void dfs(TreeNode node) {
        if (node == null) return;
        if (first < node.val && node.val < second) {
            second = node.val;
        }
        dfs(node.left);
        dfs(node.right);
    }
}
