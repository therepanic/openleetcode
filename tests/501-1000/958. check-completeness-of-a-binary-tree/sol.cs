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
    public bool IsCompleteTree(TreeNode root) {
        var q = new System.Collections.Generic.Queue<TreeNode>();
        q.Enqueue(root);
        bool past = false;
        while (q.Count > 0) {
            TreeNode node = q.Dequeue();
            if (node == null) {
                past = true;
            } else {
                if (past) return false;
                q.Enqueue(node.left);
                q.Enqueue(node.right);
            }
        }
        return true;
    }
}
