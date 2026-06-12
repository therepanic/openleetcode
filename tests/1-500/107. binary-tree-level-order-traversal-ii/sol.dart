
class Solution {
  List<List<int>> levelOrderBottom(TreeNode? root) {
    if (root == null) return [];
    final levels = <List<int>>[];
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
      levels.add(level);
    }
    return levels.reversed.toList();
  }
}
