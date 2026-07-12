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
  int rangeSumBST(TreeNode? root, int low, int high) {
    int res = 0;
    void dfs(TreeNode? node) {
      if (node == null) {
        return;
      }
      dfs(node.left);
      if (low <= node.val && node.val <= high) {
        res += node.val;
      }
      dfs(node.right);
    }
    dfs(root);
    return res;
  }
}
