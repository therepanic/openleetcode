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
  int sumRootToLeaf(TreeNode? root) {
    int dfs(TreeNode? node, int current) {
      if (node == null) {
        return 0;
      }
      
      current = current * 2 + node.val;
      
      if (node.left == null && node.right == null) {
        return current;
      }
      
      return dfs(node.left, current) + dfs(node.right, current);
    }
    
    return dfs(root, 0);
  }
}
