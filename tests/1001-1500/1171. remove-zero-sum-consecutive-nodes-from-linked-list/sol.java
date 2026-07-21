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
    public ListNode removeZeroSumSublists(ListNode head) {
        ListNode dummy = new ListNode(0);
        dummy.next = head;
        int prefixSum = 0;
        java.util.Map<Integer, ListNode> seen = new java.util.HashMap<>();

        ListNode curr = dummy;
        while (curr != null) {
            prefixSum += curr.val;
            seen.put(prefixSum, curr);
            curr = curr.next;
        }

        prefixSum = 0;
        curr = dummy;
        while (curr != null) {
            prefixSum += curr.val;
            curr.next = seen.get(prefixSum).next;
            curr = curr.next;
        }

        return dummy.next;
    }
}
