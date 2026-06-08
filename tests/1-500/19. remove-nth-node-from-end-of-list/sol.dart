class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    final dummy = ListNode(0, head);
    var fast = dummy;
    var slow = dummy;
    for (var i = 0; i < n; i++) {
      fast = fast.next!;
    }
    while (fast.next != null) {
      fast = fast.next!;
      slow = slow.next!;
    }
    slow.next = slow.next!.next;
    return dummy.next;
  }
}
