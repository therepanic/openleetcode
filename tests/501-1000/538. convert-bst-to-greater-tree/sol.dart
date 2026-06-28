/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
    int total = 0;
    
    TreeNode? convertBST(TreeNode? root) {
        traverse(root);
        return root;
    }
    
    void traverse(TreeNode? node) {
        if (node == null) {
            return;
        }
        traverse(node.right);
        total += node.val;
        node.val = total;
        traverse(node.left);
    }
}
