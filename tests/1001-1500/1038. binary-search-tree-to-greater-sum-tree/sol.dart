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
  int sum = 0;
  
  TreeNode? bstToGst(TreeNode? root) {
    traversal(root);
    return root;
  }
  
  void traversal(TreeNode? node) {
    if (node == null) return;
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
