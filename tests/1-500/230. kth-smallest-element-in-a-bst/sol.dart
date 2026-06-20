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
  int kthSmallest(TreeNode? root, int k) {
    List<int> inorderTraversal(TreeNode? node) {
      if (node == null) return [];
      return [...inorderTraversal(node.left), node.val, ...inorderTraversal(node.right)];
    }
    
    var sortedElements = inorderTraversal(root);
    return sortedElements[k - 1];
  }
}
