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
  int sumOfLeftLeaves(TreeNode? root) {
    int dfs(TreeNode? node, bool isLeft) {
      if (node == null) return 0;
      if (node.left == null && node.right == null) {
        return isLeft ? node.val : 0;
      }
      return dfs(node.left, true) + dfs(node.right, false);
    }
    return dfs(root, false);
  }
}
