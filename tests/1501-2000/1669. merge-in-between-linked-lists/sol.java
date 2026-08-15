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
    public ListNode mergeInBetween(ListNode list1, int a, int b, ListNode list2) {
        ListNode curr = list1;
        for (int i = 0; i < a-1; i++) {
            curr = curr.next;
        }
        ListNode prev = curr;
        for (int i = 0; i < b-a+2; i++) {
            curr = curr.next;
        }
        prev.next = list2;
        prev = prev.next;
        while (prev.next != null) {
            prev = prev.next;
        }
        prev.next = curr;
        return list1;
    }
}
