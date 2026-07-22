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
    public int maxLevelSum(TreeNode root) {
        int idx = 0;
        int maxSum = Integer.MIN_VALUE;
        java.util.Queue<TreeNode> q = new java.util.LinkedList<>();
        q.offer(root);
        int level = 1;
        while (!q.isEmpty()) {
            int qz = q.size();
            int curSum = 0;
            for (int i = 0; i < qz; i++) {
                TreeNode node = q.poll();
                curSum += node.val;
                if (node.left != null) q.offer(node.left);
                if (node.right != null) q.offer(node.right);
            }
            if (curSum > maxSum) {
                idx = level;
                maxSum = curSum;
            }
            level++;
        }
        return idx;
    }
}
