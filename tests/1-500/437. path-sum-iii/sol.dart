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
  int pathSum(TreeNode? root, int targetSum) {
    Map<int, int> prefixSums = {0: 1};
    int dfs(TreeNode? node, int currentSum) {
      if (node == null) return 0;
      currentSum += node.val;
      int count = prefixSums[currentSum - targetSum] ?? 0;
      prefixSums[currentSum] = (prefixSums[currentSum] ?? 0) + 1;
      count += dfs(node.left, currentSum);
      count += dfs(node.right, currentSum);
      prefixSums[currentSum] = prefixSums[currentSum]! - 1;
      return count;
    }
    return dfs(root, 0);
  }
}
