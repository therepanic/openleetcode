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
    public int maxAncestorDiff(TreeNode root) {
        int[] m = new int[]{0};
        dfs(root, m);
        return m[0];
    }
    
    private int[] dfs(TreeNode root, int[] m) {
        if (root == null) {
            return new int[]{Integer.MAX_VALUE, Integer.MIN_VALUE};
        }
        int[] left = dfs(root.left, m);
        int[] right = dfs(root.right, m);
        int minVal = Math.min(root.val, Math.min(left[0], right[0]));
        int maxVal = Math.max(root.val, Math.max(left[1], right[1]));
        m[0] = Math.max(m[0], Math.max(Math.abs(minVal - root.val), Math.abs(maxVal - root.val)));
        return new int[]{minVal, maxVal};
    }
}
