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
    public TreeNode TrimBST(TreeNode root, int low, int high) {
        if (root == null) {
            return null;
        }
        
        if (root.val < low) {
            return TrimBST(root.right, low, high);
        }
        if (root.val > high) {
            return TrimBST(root.left, low, high);
        }
        
        root.left = TrimBST(root.left, low, high);
        root.right = TrimBST(root.right, low, high);
        
        return root;
    }
}
