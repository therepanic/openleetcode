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
  int deepestLeavesSum(TreeNode? root) {
    final depthMap = <int, int>{};
    
    void dfs(TreeNode? node, int depth) {
      if (node == null) return;
      if (node.left == null && node.right == null) {
        depthMap[depth] = (depthMap[depth] ?? 0) + node.val;
      }
      dfs(node.left, depth + 1);
      dfs(node.right, depth + 1);
    }
    
    dfs(root, 0);
    
    int maxDepth = depthMap.keys.reduce((a, b) => a > b ? a : b);
    return depthMap[maxDepth] ?? 0;
  }
}
