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
  int moves = 0;
  
  int distributeCoins(TreeNode? root) {
    solve(root);
    return moves;
  }
  
  int solve(TreeNode? node) {
    if (node == null) return 0;
    int leftCandie = solve(node.left);
    int rightCandie = solve(node.right);
    moves += (leftCandie).abs() + (rightCandie).abs();
    return (leftCandie + rightCandie + node.val) - 1;
  }
}
