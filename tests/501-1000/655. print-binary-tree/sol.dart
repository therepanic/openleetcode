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
  int findHeight(TreeNode? node) {
    if (node == null) return 0;
    int height = 0;
    if (node.left != null) {
      height = height > 1 + findHeight(node.left) ? height : 1 + findHeight(node.left);
    }
    if (node.right != null) {
      height = height > 1 + findHeight(node.right) ? height : 1 + findHeight(node.right);
    }
    return height;
  }

  List<List<String>> printTree(TreeNode? root) {
    int height = findHeight(root);
    int m = height + 1;
    int n = (1 << (height + 1)) - 1;
    List<List<String>> matrix = List.generate(m, (_) => List.filled(n, ""));
    
    var queue = Queue<Tuple>();
    queue.add(Tuple(root!, 0, (n - 1) ~/ 2));
    while (queue.isNotEmpty) {
      int levelSize = queue.length;
      for (int i = 0; i < levelSize; i++) {
        var front = queue.removeFirst();
        matrix[front.x][front.y] = front.node.val.toString();
        if (front.node.left != null) {
          queue.add(Tuple(front.node.left!, front.x + 1, front.y - (1 << (height - front.x - 1))));
        }
        if (front.node.right != null) {
          queue.add(Tuple(front.node.right!, front.x + 1, front.y + (1 << (height - front.x - 1))));
        }
      }
    }
    return matrix;
  }
}

class Tuple {
  final TreeNode node;
  final int x;
  final int y;
  Tuple(this.node, this.x, this.y);
}
