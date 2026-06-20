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
  TreeNode? invertTree(TreeNode? root) {
    if (root == null) {
      return null;
    }
    TreeNode? l = invertTree(root.left);
    TreeNode? r = invertTree(root.right);
    root.left = r;
    root.right = l;
    return root;
  }
}
