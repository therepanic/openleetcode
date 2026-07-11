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
  TreeNode? insertIntoMaxTree(TreeNode? root, int val) {
    TreeNode? dfs(TreeNode? node) {
      if (node == null) {
        return TreeNode(val);
      }
      if (node.val > val) {
        node.right = dfs(node.right);
        return node;
      }
      TreeNode temp = TreeNode(val);
      temp.left = node;
      return temp;
    }
    return dfs(root);
  }
}
