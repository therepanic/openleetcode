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
  bool findTarget(TreeNode? root, int k) {
    Set<int> seen = {};
    
    bool dfs(TreeNode? node) {
      if (node == null) return false;
      if (seen.contains(k - node.val)) return true;
      seen.add(node.val);
      return dfs(node.left) || dfs(node.right);
    }
    
    return dfs(root);
  }
}
