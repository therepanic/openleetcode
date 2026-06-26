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
  List<int> largestValues(TreeNode? root) {
    List<int> res = [];
    void dfs(TreeNode? node, int level) {
      if (node == null) return;
      if (level == res.length) {
        res.add(node.val);
      } else {
        res[level] = res[level] > node.val ? res[level] : node.val;
      }
      dfs(node.left, level + 1);
      dfs(node.right, level + 1);
    }
    dfs(root, 0);
    return res;
  }
}
