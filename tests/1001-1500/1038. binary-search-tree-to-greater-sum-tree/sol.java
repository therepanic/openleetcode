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
    private int sum = 0;
    
    public TreeNode bstToGst(TreeNode root) {
        traversal(root);
        return root;
    }
    
    private void traversal(TreeNode node) {
        if (node.right != null) {
            traversal(node.right);
        }
        sum += node.val;
        node.val = sum;
        if (node.left != null) {
            traversal(node.left);
        }
    }
}
