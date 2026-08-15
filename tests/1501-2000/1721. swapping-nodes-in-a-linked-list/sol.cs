/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public int val;
 *     public ListNode next;
 *     public ListNode(int val=0, ListNode next=null) {
 *         this.val = val;
 *         this.next = next;
 *     }
 * }
 */
public class Solution {
    public ListNode SwapNodes(ListNode head, int k) {
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

        ListNode tempNext = first.next;
        first.next = second.next;
        second.next = tempNext;

        if (k == 1) {
            return second;
        }
        if (second == head) {
            return first;
        }

        return head;
    }
}
