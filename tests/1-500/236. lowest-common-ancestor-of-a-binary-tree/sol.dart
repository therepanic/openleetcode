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
  TreeNode? lowestCommonAncestor(TreeNode? root, TreeNode? p, TreeNode? q) {
    if (root == null) {
      return null;
    }

    if (root.val == p!.val || root.val == q!.val) {
      return root;
    }

    TreeNode? left = lowestCommonAncestor(root.left, p, q);
    TreeNode? right = lowestCommonAncestor(root.right, p, q);

    if (left != null && right != null) {
      return root;
    }

    return left ?? right;
  }
}
