/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public int val;
 *     public TreeNode left;
 *     public TreeNode right;
 *     public TreeNode(int val=0, TreeNode left=null, TreeNode right=null) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
public class Solution {
    private int SubtreeCount(TreeNode node) {
        if (node == null) return 0;
        int leftCount = SubtreeCount(node.left);
        int rightCount = SubtreeCount(node.right);
        return leftCount + rightCount + 1;
    }

    public bool BtreeGameWinningMove(TreeNode root, int n, int x) {
        var queue = new System.Collections.Generic.Queue<TreeNode>();
        queue.Enqueue(root);
        TreeNode node = null;
        while (queue.Count > 0) {
            TreeNode front = queue.Dequeue();
            if (front.val == x) {
                node = front;
                break;
            }
            if (front.left != null) queue.Enqueue(front.left);
            if (front.right != null) queue.Enqueue(front.right);
        }

        int leftCount = SubtreeCount(node.left);
        int rightCount = SubtreeCount(node.right);
        int parentCount = n - leftCount - rightCount - 1;
        if (parentCount > leftCount + rightCount) return true;
        else if (leftCount > parentCount + rightCount) return true;
        else if (rightCount > parentCount + leftCount) return true;
        return false;
    }
}
