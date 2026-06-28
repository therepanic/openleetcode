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
  int? prev;
  int ans = double.maxFinite.toInt();

  int getMinimumDifference(TreeNode? root) {
    dfs(root);
    return ans;
  }

  void dfs(TreeNode? node) {
    if (node == null) return;
    dfs(node.left);
    if (prev != null) {
      final diff = node.val - prev!;
      if (diff < ans) ans = diff;
    }
    prev = node.val;
    dfs(node.right);
  }
}
