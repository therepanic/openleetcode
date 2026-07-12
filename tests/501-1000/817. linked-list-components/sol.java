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
    public int numComponents(ListNode head, int[] nums) {
        Set<Integer> nodeSet = new HashSet<>();
        for (int num : nums) {
            nodeSet.add(num);
        }
        int count = 0;
        boolean inComponent = false;
        while (head != null) {
            if (nodeSet.contains(head.val)) {
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
