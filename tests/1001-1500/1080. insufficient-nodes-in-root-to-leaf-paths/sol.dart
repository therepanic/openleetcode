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
  TreeNode? sufficientSubset(TreeNode? root, int limit) {
    bool dfs(TreeNode? node, int pathSum) {
      if (node == null) {
        return false;
      }
      
      int curr = pathSum + node.val;
      
      if (node.left == null && node.right == null) {
        return curr >= limit;
      }
      
      bool leftGood = dfs(node.left, curr);
      bool rightGood = dfs(node.right, curr);
      
      if (!leftGood) {
        node.left = null;
      }
      if (!rightGood) {
        node.right = null;
      }
      
      return leftGood || rightGood;
    }
    
    return dfs(root, 0) ? root : null;
  }
}
