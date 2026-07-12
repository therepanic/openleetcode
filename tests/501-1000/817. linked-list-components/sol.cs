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
    public int NumComponents(ListNode head, int[] nums) {
        HashSet<int> nodeSet = new HashSet<int>(nums);
        int count = 0;
        bool inComponent = false;
        while (head != null) {
            if (nodeSet.Contains(head.val)) {
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
