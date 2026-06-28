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
  TreeNode? searchBST(TreeNode? root, int val) {
    if (root == null || root.val == val) {
      return root;
    }
    if (val < root.val) {
      return searchBST(root.left, val);
    }
    return searchBST(root.right, val);
  }
}
