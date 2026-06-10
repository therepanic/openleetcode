
class Solution {
  TreeNode? sortedListToBST(ListNode? head) {
    final values = <int>[];
    while (head != null) {
      values.add(head.val);
      head = head.next;
    }

    TreeNode? build(int left, int right) {
      if (left > right) return null;
      final mid = left + ((right - left) >> 1);
      final root = TreeNode(values[mid]);
      root.left = build(left, mid - 1);
      root.right = build(mid + 1, right);
      return root;
    }

    return build(0, values.length - 1);
  }
}
