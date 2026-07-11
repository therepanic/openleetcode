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
  int maxAncestorDiff(TreeNode? root) {
    if (root == null) {
      return 0;
    }
    return dfs(root, root.val, root.val);
  }

  int dfs(TreeNode? node, int mn, int mx) {
    if (node == null) {
      return mx - mn;
    }
    if (node.val < mn) {
      mn = node.val;
    }
    if (node.val > mx) {
      mx = node.val;
    }
    final left = dfs(node.left, mn, mx);
    final right = dfs(node.right, mn, mx);
    return left > right ? left : right;
  }
}
