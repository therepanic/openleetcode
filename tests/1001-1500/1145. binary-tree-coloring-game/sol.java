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
    private int subtreeCount(TreeNode node) {
        if (node == null) return 0;
        int leftCount = subtreeCount(node.left);
        int rightCount = subtreeCount(node.right);
        return leftCount + rightCount + 1;
    }

    public boolean btreeGameWinningMove(TreeNode root, int n, int x) {
        java.util.Queue<TreeNode> queue = new java.util.LinkedList<>();
        queue.offer(root);
        TreeNode node = null;
        while (!queue.isEmpty()) {
            TreeNode front = queue.poll();
            if (front.val == x) {
                node = front;
                break;
            }
            if (front.left != null) queue.offer(front.left);
            if (front.right != null) queue.offer(front.right);
        }

        int leftCount = subtreeCount(node.left);
        int rightCount = subtreeCount(node.right);
        int parentCount = n - leftCount - rightCount - 1;
        if (parentCount > leftCount + rightCount) return true;
        else if (leftCount > parentCount + rightCount) return true;
        else if (rightCount > parentCount + leftCount) return true;
        return false;
    }
}
