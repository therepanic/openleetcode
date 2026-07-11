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
  List<int> flipMatchVoyage(TreeNode? root, List<int> voyage) {
    List<int> flippedNodes = [];
    int idx = 0;
    
    bool dfs(TreeNode? node) {
      if (node == null) return true;
      if (node.val != voyage[idx]) return false;
      
      idx++;
      if (node.left != null && node.right != null) {
        if (voyage[idx] == node.right!.val) {
          flippedNodes.add(node.val);
          if (!dfs(node.right)) return false;
          if (!dfs(node.left)) return false;
        } else if (voyage[idx] == node.left!.val) {
          if (!dfs(node.left)) return false;
          if (!dfs(node.right)) return false;
        } else {
          return false;
        }
      } else {
        if (node.left != null) {
          if (!dfs(node.left)) return false;
        } else if (node.right != null) {
          if (!dfs(node.right)) return false;
        }
      }
      return true;
    }
    
    if (!dfs(root)) return [-1];
    return flippedNodes;
  }
}
