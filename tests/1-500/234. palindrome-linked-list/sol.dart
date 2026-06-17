/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  bool isPalindrome(ListNode? head) {
    ListNode? slow = head;
    ListNode? fast = head;
    
    // Step 1
    while (fast != null && fast.next != null) {
      fast = fast.next!.next;
      slow = slow!.next;
    }
    
    // Step 2
    ListNode? node = null;
    while (slow != null) {
      ListNode? temp = slow.next;
      slow.next = node;
      node = slow;
      slow = temp;
    }
    
    // Step 3
    ListNode? first = head;
    ListNode? second = node;
    while (second != null) {
      if (first!.val != second.val) {
        return false;
      }
      first = first.next;
      second = second.next;
    }
    
    return true;
  }
}
