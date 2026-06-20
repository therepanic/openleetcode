import 'dart:collection';

class Solution {
  List<int> rightSideView(TreeNode? root) {
    if (root == null) {
      return [];
    }

    final result = <int>[];
    final queue = Queue<TreeNode>();
    queue.add(root);
    while (queue.isNotEmpty) {
      var remaining = queue.length;
      var rightmost = 0;
      while (remaining > 0) {
        final node = queue.removeFirst();
        rightmost = node.val;
        if (node.left != null) {
          queue.add(node.left!);
        }
        if (node.right != null) {
          queue.add(node.right!);
        }
        remaining--;
      }
      result.add(rightmost);
    }
    return result;
  }
}
