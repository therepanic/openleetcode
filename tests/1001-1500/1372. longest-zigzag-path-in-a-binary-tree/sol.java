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
    public int longestZigZag(TreeNode root) {
        if (root == null) return 0;
        int best = 0;
        Stack<Object[]> stack = new Stack<>();
        stack.push(new Object[]{root, 0, 0});
        while (!stack.isEmpty()) {
            Object[] cur = stack.pop();
            TreeNode node = (TreeNode) cur[0];
            int endedLeft = (int) cur[1];
            int endedRight = (int) cur[2];
            best = Math.max(best, Math.max(endedLeft, endedRight));
            if (node.left != null) {
                stack.push(new Object[]{node.left, endedRight + 1, 0});
            }
            if (node.right != null) {
                stack.push(new Object[]{node.right, 0, endedLeft + 1});
            }
        }
        return best;
    }
}
