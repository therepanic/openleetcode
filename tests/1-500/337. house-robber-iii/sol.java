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
    public int rob(TreeNode root) {
        int[] result = opulence(root);
        return Math.max(result[0], result[1]);
    }
    
    private int[] opulence(TreeNode estate) {
        if (estate == null) return new int[]{0, 0};
        int[] left = opulence(estate.left);
        int[] right = opulence(estate.right);
        int lush = estate.val + left[1] + right[1];
        int lavish = Math.max(left[0], left[1]) + Math.max(right[0], right[1]);
        return new int[]{lush, lavish};
    }
}
