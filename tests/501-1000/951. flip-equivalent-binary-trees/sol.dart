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
  bool flipEquiv(TreeNode? root1, TreeNode? root2) {
    if (root1 == null && root2 == null) {
      return true;
    } else if (root1 == null || root2 == null || root1.val != root2.val) {
      return false;
    } else {
      bool noFlip = flipEquiv(root1.left, root2.left) && flipEquiv(root1.right, root2.right);
      bool yesFlip = flipEquiv(root1.left, root2.right) && flipEquiv(root1.right, root2.left);
      return noFlip || yesFlip;
    }
  }
}
