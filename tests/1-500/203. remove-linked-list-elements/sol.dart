class Solution {
  ListNode? removeElements(ListNode? head, int val) {
    final dummy = ListNode(0, head);
    ListNode current = dummy;
    while (current.next != null) {
      if (current.next!.val == val) {
        current.next = current.next!.next;
      } else {
        current = current.next!;
      }
    }
    return dummy.next;
  }
}
