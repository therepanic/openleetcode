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
  TreeNode? bstFromPreorder(List<int> preorder) {
    if (preorder.isEmpty) {
      return null;
    }
    return build(preorder, 0, preorder.length - 1);
  }
  
  TreeNode? build(List<int> preorder, int start, int end) {
    if (start > end) {
      return null;
    }
    TreeNode root = TreeNode(preorder[start]);
    int i = start + 1;
    while (i <= end && preorder[i] < root.val) {
      i++;
    }
    root.left = build(preorder, start + 1, i - 1);
    root.right = build(preorder, i, end);
    return root;
  }
}
