class Solution {
  List<int> postorderTraversal(TreeNode? root) {
    final result = <int>[];
    if (root == null) return result;

    final stack = <TreeNode>[root];
    while (stack.isNotEmpty) {
      final node = stack.removeLast();
      result.add(node.val);
      if (node.left != null) stack.add(node.left!);
      if (node.right != null) stack.add(node.right!);
    }
    return result.reversed.toList();
  }
}
