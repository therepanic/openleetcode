/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? removeZeroSumSublists(ListNode? head) {
    ListNode dummy = ListNode(0);
    dummy.next = head;
    int prefixSum = 0;
    Map<int, ListNode> seen = {};

    ListNode? curr = dummy;
    while (curr != null) {
      prefixSum += curr.val;
      seen[prefixSum] = curr;
      curr = curr.next;
    }

    prefixSum = 0;
    curr = dummy;
    while (curr != null) {
      prefixSum += curr.val;
      curr.next = seen[prefixSum]!.next;
      curr = curr.next;
    }

    return dummy.next;
  }
}
