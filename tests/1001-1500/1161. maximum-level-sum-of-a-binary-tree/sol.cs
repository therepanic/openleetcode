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
    public int MaxLevelSum(TreeNode root) {
        int idx = 0;
        int maxSum = int.MinValue;
        var q = new Queue<TreeNode>();
        q.Enqueue(root);
        int level = 1;
        while (q.Count > 0) {
            int qz = q.Count;
            int curSum = 0;
            for (int i = 0; i < qz; i++) {
                TreeNode node = q.Dequeue();
                curSum += node.val;
                if (node.left != null) q.Enqueue(node.left);
                if (node.right != null) q.Enqueue(node.right);
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
