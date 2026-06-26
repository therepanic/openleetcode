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
  int findTilt(TreeNode? root) {
    ans = 0;
    helper(root);
    return ans;
  }
  int helper(TreeNode? n) {
    if (n == null) return 0;
    int l = helper(n.left);
    int r = helper(n.right);
    ans += (l - r).abs();
    return l + r + n.val;
  }
}
