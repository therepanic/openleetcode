class Solution {
  ListNode? reverseBetween(ListNode? head, int left, int right) {
    final dummy = ListNode(0, head);
    ListNode? prev = dummy;

    for (int i = 1; i < left; i++) {
      prev = prev!.next;
    }

    final curr = prev!.next;
    for (int i = 0; i < right - left; i++) {
      final node = curr!.next;
      curr.next = node!.next;
      node.next = prev.next;
      prev.next = node;
    }

    return dummy.next;
  }
}
