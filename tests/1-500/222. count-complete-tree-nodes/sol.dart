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
  int countNodes(TreeNode? root) {
    if (root == null) {
      return 0;
    }
    
    int leftDepth = getDepth(root.left);
    int rightDepth = getDepth(root.right);
    
    if (leftDepth == rightDepth) {
      return (1 << leftDepth) + countNodes(root.right);
    } else {
      return (1 << rightDepth) + countNodes(root.left);
    }
  }
  
  int getDepth(TreeNode? node) {
    int depth = 0;
    while (node != null) {
      depth++;
      node = node.left;
    }
    return depth;
  }
}
