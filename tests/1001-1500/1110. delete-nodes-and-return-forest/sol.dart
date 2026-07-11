import 'dart:collection';

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
  List<TreeNode?> delNodes(TreeNode? root, List<int> toDelete) {
    List<TreeNode?> result = <TreeNode?>[];
    if (root == null) {
      return result;
    }

    Set<int> deleted = toDelete.toSet();
    TreeNode ref = TreeNode(-1);
    ref.left = root;

    Queue<TreeNode> queue = Queue<TreeNode>();
    Queue<TreeNode> pending = Queue<TreeNode>()..add(ref);

    while (pending.isNotEmpty) {
      TreeNode current = pending.removeFirst();

      if (current.left != null) {
        if (deleted.contains(current.left!.val)) {
          pending.add(current.left!);
        } else {
          result.add(current.left);
          queue.add(current.left!);
        }
        current.left = null;
      }

      if (current.right != null) {
        if (deleted.contains(current.right!.val)) {
          pending.add(current.right!);
        } else {
          result.add(current.right);
          queue.add(current.right!);
        }
        current.right = null;
      }

      while (queue.isNotEmpty) {
        TreeNode node = queue.removeFirst();

        if (node.left != null) {
          if (deleted.contains(node.left!.val)) {
            pending.add(node.left!);
            node.left = null;
          } else {
            queue.add(node.left!);
          }
        }

        if (node.right != null) {
          if (deleted.contains(node.right!.val)) {
            pending.add(node.right!);
            node.right = null;
          } else {
            queue.add(node.right!);
          }
        }
      }
    }

    return result;
  }
}
