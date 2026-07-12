/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  int numComponents(ListNode? head, List<int> nums) {
    var nodeSet = nums.toSet();
    int count = 0;
    bool inComponent = false;
    while (head != null) {
      if (nodeSet.contains(head.val)) {
        if (!inComponent) {
          count++;
          inComponent = true;
        }
      } else {
        inComponent = false;
      }
      head = head.next;
    }
    return count;
  }
}
