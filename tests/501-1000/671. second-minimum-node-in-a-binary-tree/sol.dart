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
  int findSecondMinimumValue(TreeNode? root) {
    int first = root!.val;
    int second = 0x7FFFFFFFFFFFFFFF; // max int
    
    void dfs(TreeNode? node) {
      if (node == null) return;
      if (first < node.val && node.val < second) {
        second = node.val;
      }
      dfs(node.left);
      dfs(node.right);
    }
    
    dfs(root);
    return second == 0x7FFFFFFFFFFFFFFF ? -1 : second;
  }
}
