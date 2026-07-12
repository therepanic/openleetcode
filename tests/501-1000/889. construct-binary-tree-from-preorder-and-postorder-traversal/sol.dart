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
  TreeNode? constructFromPrePost(List<int> preorder, List<int> postorder) {
    int index = 0;

    TreeNode? build(int left, int right) {
      if (index >= preorder.length || left > right) {
        return null;
      }

      final root = TreeNode(preorder[index++]);
      if (left == right || index >= preorder.length) {
        return root;
      }

      var split = left;
      while (split <= right && postorder[split] != preorder[index]) {
        split++;
      }

      if (split <= right) {
        root.left = build(left, split);
        root.right = build(split + 1, right - 1);
      }

      return root;
    }

    return build(0, postorder.length - 1);
  }
}
