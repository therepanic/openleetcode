class Solution {
  ListNode? insertionSortList(ListNode? head) {
    final values = <int>[];
    while (head != null) {
      values.add(head.val);
      head = head.next;
    }
    values.sort();

    final dummy = ListNode(0);
    var tail = dummy;
    for (final value in values) {
      tail.next = ListNode(value);
      tail = tail.next!;
    }
    return dummy.next;
  }
}
