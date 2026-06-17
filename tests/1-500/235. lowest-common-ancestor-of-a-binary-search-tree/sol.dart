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
  TreeNode? lowestCommonAncestor(TreeNode? root, TreeNode? p, TreeNode? q) {
    final int pVal = p!.val;
    final int qVal = q!.val;
    while (root != null) {
      if (pVal < root.val && qVal < root.val) {
        root = root.left;
      } else if (pVal > root.val && qVal > root.val) {
        root = root.right;
      } else {
        return root;
      }
    }
    return null;
  }
}
