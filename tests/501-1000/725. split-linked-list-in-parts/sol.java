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
    public ListNode[] splitListToParts(ListNode head, int k) {
        // Step 1: Calculate the length of the linked list
        int length = 0;
        ListNode current = head;
        while (current != null) {
            length++;
            current = current.next;
        }
        
        // Step 2: Determine the size of each part
        int partSize = length / k;
        int largerParts = length % k;
        
        // Initialize an array to store the results
        ListNode[] result = new ListNode[k];
        
        // Step 3: Split the linked list into parts
        current = head;
        for (int i = 0; i < k; i++) {
            int sublistSize = i < largerParts ? partSize + 1 : partSize;
            if (sublistSize == 0) {
                result[i] = null;
            } else {
                ListNode sublistHead = current;
                for (int j = 0; j < sublistSize - 1; j++) {
                    current = current.next;
                }
                ListNode nextNode = current.next;
                current.next = null;
                result[i] = sublistHead;
                current = nextNode;
            }
        }
        
        return result;
    }
}
