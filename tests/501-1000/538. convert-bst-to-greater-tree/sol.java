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
    private int total = 0;
    
    public TreeNode convertBST(TreeNode root) {
        traverse(root);
        return root;
    }
    
    private void traverse(TreeNode node) {
        if (node == null) {
            return;
        }
        traverse(node.right);
        total += node.val;
        node.val = total;
        traverse(node.left);
    }
}
