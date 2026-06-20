
class Solution {
  List<List<int>> levelOrder(TreeNode? root) {
    if (root == null) return [];
    final result = <List<int>>[];
    final queue = <TreeNode>[root];
    var head = 0;
    while (head < queue.length) {
      final size = queue.length - head;
      final level = <int>[];
      for (var i = 0; i < size; i++) {
        final node = queue[head++];
        level.add(node.val);
        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }
      result.add(level);
    }
    return result;
  }
}
