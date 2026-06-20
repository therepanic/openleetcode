class Solution {
  ListNode? reverseList(ListNode? head) {
    ListNode? prev;
    while (head != null) {
      final next = head.next;
      head.next = prev;
      prev = head;
      head = next;
    }
    return prev;
  }
}
