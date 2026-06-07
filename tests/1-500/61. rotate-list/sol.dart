class Solution {
  ListNode? rotateRight(ListNode? head, int k) {
    if (head == null || head.next == null || k == 0) {
      return head;
    }

    var length = 1;
    ListNode tail = head;
    while (tail.next != null) {
      tail = tail.next!;
      length++;
    }

    k %= length;
    if (k == 0) {
      return head;
    }

    tail.next = head;
    final steps = length - k;
    ListNode newTail = head;
    for (var i = 1; i < steps; i++) {
      newTail = newTail.next!;
    }

    final newHead = newTail.next;
    newTail.next = null;
    return newHead;
  }
}
