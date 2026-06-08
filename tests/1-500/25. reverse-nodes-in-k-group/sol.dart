class Solution {
  ListNode? reverseKGroup(ListNode? head, int k) {
    final dummy = ListNode(0, head);
    var groupPrev = dummy;
    while (true) {
      final kth = _getKthNode(groupPrev, k);
      if (kth == null) break;
      final groupNext = kth.next;
      ListNode? prev = groupNext;
      var cur = groupPrev.next;
      while (cur != groupNext) {
        final tmp = cur!.next;
        cur.next = prev;
        prev = cur;
        cur = tmp;
      }
      final tmp = groupPrev.next;
      groupPrev.next = kth;
      groupPrev = tmp!;
    }
    return dummy.next;
  }

  ListNode? _getKthNode(ListNode? start, int k) {
    while (start != null && k > 0) {
      start = start.next;
      k--;
    }
    return start;
  }
}
