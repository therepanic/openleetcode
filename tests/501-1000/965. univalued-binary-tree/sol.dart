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
  bool isUnivalTree(TreeNode? root) {
    if (root == null) {
      return true;
    }
    if (root.left != null && root.left!.val != root.val) {
      return false;
    }
    if (root.right != null && root.right!.val != root.val) {
      return false;
    }
    return isUnivalTree(root.left) && isUnivalTree(root.right);
  }
}
