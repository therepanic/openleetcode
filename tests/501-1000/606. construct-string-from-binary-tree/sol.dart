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
  String tree2str(TreeNode? root) {
    if (root == null) return "";
    String s = root.val.toString();
    if (root.left != null || root.right != null) {
      s += "(" + tree2str(root.left) + ")";
    }
    if (root.right != null) {
      s += "(" + tree2str(root.right) + ")";
    }
    return s;
  }
}
