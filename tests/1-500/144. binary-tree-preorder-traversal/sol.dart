class Solution {
  List<int> preorderTraversal(TreeNode? root) {
    final result = <int>[];
    if (root == null) return result;

    final stack = <TreeNode>[root];
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      result.add(node.val);
      if (node.right != null) stack.add(node.right!);
      if (node.left != null) stack.add(node.left!);
    }
    return result;
  }
}
