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
  int subtreeCount(TreeNode? node) {
    if (node == null) return 0;
    int leftCount = subtreeCount(node.left);
    int rightCount = subtreeCount(node.right);
    return leftCount + rightCount + 1;
  }

  bool btreeGameWinningMove(TreeNode? root, int n, int x) {
    var queue = <TreeNode?>[root];
    TreeNode? node;
    while (queue.isNotEmpty) {
      var front = queue.removeAt(0);
      if (front!.val == x) {
        node = front;
        break;
      }
      if (front.left != null) queue.add(front.left);
      if (front.right != null) queue.add(front.right);
    }

    int leftCount = subtreeCount(node!.left);
    int rightCount = subtreeCount(node.right);
    int parentCount = n - leftCount - rightCount - 1;
    if (parentCount > leftCount + rightCount) {
      return true;
    } else if (leftCount > parentCount + rightCount) {
      return true;
    } else if (rightCount > parentCount + leftCount) {
      return true;
    }
    return false;
  }
}
