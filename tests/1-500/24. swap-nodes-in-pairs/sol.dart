class Solution {
  ListNode? swapPairs(ListNode? head) {
    if (head == null || head.next == null) return head;
    final second = head.next!;
    head.next = swapPairs(second.next);
    second.next = head;
    return second;
  }
}
