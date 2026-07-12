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
  int minCameraCover(TreeNode? root) {
    int dfs(TreeNode? node) {
      if (node == null) return 0;
      int res = dfs(node.left) + dfs(node.right);
      int curr = double.maxFinite.toInt();
      if (node.left != null && node.left!.val < curr) {
        curr = node.left!.val;
      }
      if (node.right != null && node.right!.val < curr) {
        curr = node.right!.val;
      }
      if (curr == 0) {
        node.val = 1;
        res += 1;
      } else if (curr == 1) {
        node.val = 2;
      }
      return res;
    }
    return dfs(root) + (root!.val == 0 ? 1 : 0);
  }
}
