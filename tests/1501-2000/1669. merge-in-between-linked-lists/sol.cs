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
    public ListNode MergeInBetween(ListNode list1, int a, int b, ListNode list2) {
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
