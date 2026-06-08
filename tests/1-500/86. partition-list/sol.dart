class Solution {
  ListNode? partition(ListNode? head, int x) {
    final smallDummy = ListNode(0);
    final bigDummy = ListNode(0);
    var small = smallDummy;
    var big = bigDummy;
    while (head != null) {
      final next = head.next;
      head.next = null;
      if (head.val < x) {
        small.next = head;
        small = small.next!;
      } else {
        big.next = head;
        big = big.next!;
      }
      head = next;
    }
    small.next = bigDummy.next;
    return smallDummy.next;
  }
}
