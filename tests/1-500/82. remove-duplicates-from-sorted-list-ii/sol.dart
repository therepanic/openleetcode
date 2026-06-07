class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    final dummy = ListNode(0, head);
    var prev = dummy;
    var cur = head;
    while (cur != null) {
      ListNode node = cur;
      var dup = false;
      while (node.next != null && node.val == node.next!.val) {
        dup = true;
        node = node.next!;
      }
      if (dup) {
        prev.next = node.next;
      } else {
        prev = prev.next!;
      }
      cur = node.next;
    }
    return dummy.next;
  }
}
