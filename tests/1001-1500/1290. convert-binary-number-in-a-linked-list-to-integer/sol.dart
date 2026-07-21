/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  int getDecimalValue(ListNode? head) {
    int num = 0;
    while (head != null) {
      num = (num << 1) | head.val;
      head = head.next;
    }
    return num;
  }
}
