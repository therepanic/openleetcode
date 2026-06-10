
class Solution {
  int minDepth(TreeNode? root) {
    if (root == null) return 0;
    final queue = <List<Object>>[
      [root, 1]
    ];
    var head = 0;
    while (head < queue.length) {
      final item = queue[head++];
      final node = item[0] as TreeNode;
      final depth = item[1] as int;
      if (node.left == null && node.right == null) return depth;
      if (node.left != null) queue.add([node.left!, depth + 1]);
      if (node.right != null) queue.add([node.right!, depth + 1]);
    }
    return 0;
  }
}
