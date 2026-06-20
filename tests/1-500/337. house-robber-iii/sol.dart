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
  int rob(TreeNode? root) {
    List<int> opulence(TreeNode? estate) {
      if (estate == null) return [0, 0];
      List<int> left = opulence(estate.left);
      List<int> right = opulence(estate.right);
      int lush = estate.val + left[1] + right[1];
      int lavish = max(left[0], left[1]) + max(right[0], right[1]);
      return [lush, lavish];
    }
    List<int> result = opulence(root);
    return max(result[0], result[1]);
  }
  
  int max(int a, int b) => a > b ? a : b;
}
