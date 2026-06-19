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
    public ListNode AddTwoNumbers(ListNode l1, ListNode l2) {
        var s1 = new System.Collections.Generic.Stack<int>();
        var s2 = new System.Collections.Generic.Stack<int>();

        while (l1 != null) {
            s1.Push(l1.val);
            l1 = l1.next;
        }

        while (l2 != null) {
            s2.Push(l2.val);
            l2 = l2.next;
        }

        int carry = 0;
        ListNode head = null;
        while (s1.Count > 0 || s2.Count > 0 || carry > 0) {
            int sum = carry;
            if (s1.Count > 0) sum += s1.Pop();
            if (s2.Count > 0) sum += s2.Pop();
            head = new ListNode(sum % 10, head);
            carry = sum / 10;
        }

        while (head != null && head.val == 0 && head.next != null) {
            head = head.next;
        }

        return head;
    }
}
