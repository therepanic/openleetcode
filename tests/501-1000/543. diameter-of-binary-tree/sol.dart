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
  int diameterOfBinaryTree(TreeNode? root) {
    int height(TreeNode? node) {
      if (node == null) return 0;
      int leftHeight = height(node.left);
      int rightHeight = height(node.right);
      return 1 + (leftHeight > rightHeight ? leftHeight : rightHeight);
    }
    
    int diameter(TreeNode? node) {
      if (node == null) return 0;
      int diameterThroughNode = height(node.left) + height(node.right);
      int leftDiameter = diameter(node.left);
      int rightDiameter = diameter(node.right);
      int result = diameterThroughNode;
      if (leftDiameter > result) result = leftDiameter;
      if (rightDiameter > result) result = rightDiameter;
      return result;
    }
    
    return diameter(root);
  }
}
