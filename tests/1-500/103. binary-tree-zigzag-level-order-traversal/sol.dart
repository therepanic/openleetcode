
class Solution {
  List<List<int>> zigzagLevelOrder(TreeNode? root) {
    if (root == null) return [];
    final result = <List<int>>[];
    final queue = <TreeNode>[root];
    var head = 0;
    var leftToRight = true;
    while (head < queue.length) {
      final size = queue.length - head;
      final level = List<int>.filled(size, 0);
      for (var i = 0; i < size; i++) {
        final node = queue[head++];
        final index = leftToRight ? i : size - 1 - i;
        level[index] = node.val;
        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }
      result.add(level);
      leftToRight = !leftToRight;
    }
    return result;
  }
}
