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
    public ListNode RemoveZeroSumSublists(ListNode head) {
        ListNode dummy = new ListNode(0);
        dummy.next = head;
        int prefixSum = 0;
        Dictionary<int, ListNode> seen = new Dictionary<int, ListNode>();

        ListNode curr = dummy;
        while (curr != null) {
            prefixSum += curr.val;
            seen[prefixSum] = curr;
            curr = curr.next;
        }

        prefixSum = 0;
        curr = dummy;
        while (curr != null) {
            prefixSum += curr.val;
            curr.next = seen[prefixSum].next;
            curr = curr.next;
        }

        return dummy.next;
    }
}
