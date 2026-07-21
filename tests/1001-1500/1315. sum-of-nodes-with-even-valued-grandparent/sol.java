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
    public int sumEvenGrandparent(TreeNode root) {
        Queue<Object[]> queue = new LinkedList<>();
        queue.offer(new Object[]{root, -1, -1});
        int res = 0;
        while (!queue.isEmpty()) {
            Object[] curr = queue.poll();
            TreeNode node = (TreeNode) curr[0];
            int parent = (int) curr[1];
            int grandparent = (int) curr[2];
            if (node == null) continue;
            if (grandparent % 2 == 0) {
                res += node.val;
            }
            if (node.left != null) {
                queue.offer(new Object[]{node.left, node.val, parent});
            }
            if (node.right != null) {
                queue.offer(new Object[]{node.right, node.val, parent});
            }
        }
        return res;
    }
}
