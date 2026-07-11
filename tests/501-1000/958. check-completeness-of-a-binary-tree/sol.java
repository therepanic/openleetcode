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
    public boolean isCompleteTree(TreeNode root) {
        java.util.Queue<TreeNode> q = new java.util.LinkedList<>();
        q.offer(root);
        boolean past = false;
        while (!q.isEmpty()) {
            TreeNode node = q.poll();
            if (node == null) {
                past = true;
            } else {
                if (past) return false;
                q.offer(node.left);
                q.offer(node.right);
            }
        }
        return true;
    }
}
