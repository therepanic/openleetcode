/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? swapNodes(ListNode? head, int k) {
    if (head == null || head.next == null) {
      return head;
    }

    ListNode? temp = head;
    ListNode? firstPrev;

    int n = 1;
    while (n < k) {
      firstPrev = temp;
      temp = temp?.next;
      n++;
    }

    ListNode? first = temp;

    ListNode? second = head;
    ListNode? secondPrev;
    temp = first;
    while (temp?.next != null) {
      secondPrev = second;
      temp = temp?.next;
      second = second?.next;
    }

    firstPrev?.next = second;
    secondPrev?.next = first;

    ListNode? tempNext = first?.next;
    first?.next = second?.next;
    second?.next = tempNext;

    if (k == 1) {
      return second;
    }
    if (second == head) {
      return first;
    }

    return head;
  }
}
