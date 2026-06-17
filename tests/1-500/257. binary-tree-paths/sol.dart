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
  List<String> binaryTreePaths(TreeNode? root) {
    List<String> res = [];
    if (root == null) {
      return res;
    }
    List<MapEntry<TreeNode, String>> stack = [];
    stack.add(MapEntry(root, root.val.toString()));
    while (stack.isNotEmpty) {
      var pair = stack.removeLast();
      TreeNode node = pair.key;
      String path = pair.value;
      if (node.left == null && node.right == null) {
        res.add(path);
      }
      if (node.right != null) {
        stack.add(MapEntry(node.right!, path + "->" + node.right!.val.toString()));
      }
      if (node.left != null) {
        stack.add(MapEntry(node.left!, path + "->" + node.left!.val.toString()));
      }
    }
    return res;
  }
}
