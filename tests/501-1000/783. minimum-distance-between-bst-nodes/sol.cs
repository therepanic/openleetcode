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
    private int? prev = null;
    private int minDiff = int.MaxValue;
    
    public int MinDiffInBST(TreeNode root) {
        Inorder(root);
        return minDiff;
    }
    
    private void Inorder(TreeNode root) {
        if (root == null) return;
        Inorder(root.left);
        if (prev.HasValue) {
            int diff = root.val - prev.Value;
            if (diff < minDiff) {
                minDiff = diff;
            }
        }
        prev = root.val;
        Inorder(root.right);
    }
}
