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
  int ans = 0;
  
  int solve(TreeNode? node) {
    if (node == null) return 0;
    int left = solve(node.left);
    int right = solve(node.right);
    int leftPath = 0;
    int rightPath = 0;
    if (node.left != null && node.left!.val == node.val) {
      leftPath = left + 1;
    }
    if (node.right != null && node.right!.val == node.val) {
      rightPath = right + 1;
    }
    ans = ans > (leftPath + rightPath) ? ans : (leftPath + rightPath);
    return leftPath > rightPath ? leftPath : rightPath;
  }
  
  int longestUnivaluePath(TreeNode? root) {
    ans = 0;
    solve(root);
    return ans;
  }
}
