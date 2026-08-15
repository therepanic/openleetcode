/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode swapNodes(ListNode head, int k) {
        if (head == null || head.next == null) {
            return head;
        }

        ListNode temp = head;
        ListNode firstPrev = null;

        int n = 1;
        while (n < k) {
            firstPrev = temp;
            temp = temp.next;
            n++;
        }

        ListNode first = temp;

        ListNode second = head;
        ListNode secondPrev = null;
        temp = first;
        while (temp.next != null) {
            secondPrev = second;
            temp = temp.next;
            second = second.next;
        }

        if (firstPrev != null) {
            firstPrev.next = second;
        }
        if (secondPrev != null) {
            secondPrev.next = first;
        }

        temp = first.next;
        first.next = second.next;
        second.next = temp;

        if (k == 1) {
            return second;
        }
        if (second == head) {
            return first;
        }

        return head;
    }
}
