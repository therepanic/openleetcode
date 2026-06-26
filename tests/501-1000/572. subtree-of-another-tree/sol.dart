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
  bool isSubtree(TreeNode? root, TreeNode? subRoot) {
    String ser(TreeNode? n) {
      if (n == null) return ',#';
      return ',${n.val}${ser(n.left)}${ser(n.right)}';
    }
    return ser(root).contains(ser(subRoot));
  }
}
