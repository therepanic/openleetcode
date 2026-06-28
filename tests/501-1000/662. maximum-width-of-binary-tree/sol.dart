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
  int widthOfBinaryTree(TreeNode? root) {
    var q = ListQueue<TreeNode?>();
    var ind = ListQueue<int>();
    var res = <List<int>>[];
    q.add(root);
    ind.add(0);
    while (q.isNotEmpty) {
      var l = <int>[];
      var size = q.length;
      for (int k = 0; k < size; k++) {
        var node = q.removeFirst();
        var i = ind.removeFirst();
        if (node != null) {
          l.add(i);
          if (node.left != null) {
            q.add(node.left);
            ind.add(2 * i + 1);
          }
          if (node.right != null) {
            q.add(node.right);
            ind.add(2 * i + 2);
          }
        }
      }
      res.add(l);
    }
    int maxWidth = 0;
    for (var r in res) {
      if (r.length >= 1) {
        int width = r.last - r.first + 1;
        if (width > maxWidth) {
          maxWidth = width;
        }
      }
    }
    return maxWidth;
  }
}

// Queue implementation using built-in collection
class ListQueue<T> {
  final List<T> _list = [];
  void add(T value) => _list.add(value);
  T removeFirst() => _list.removeAt(0);
  bool get isNotEmpty => _list.isNotEmpty;
  int get length => _list.length;
}
