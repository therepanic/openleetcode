/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  List<ListNode?> splitListToParts(ListNode? head, int k) {
    // Step 1: Calculate the length of the linked list
    int length = 0;
    ListNode? current = head;
    while (current != null) {
      length++;
      current = current.next;
    }
    
    // Step 2: Determine the size of each part
    int partSize = length ~/ k;
    int largerParts = length % k;
    
    // Initialize a list to store the results
    List<ListNode?> result = List.filled(k, null);
    
    // Step 3: Split the linked list into parts
    current = head;
    for (int i = 0; i < k; i++) {
      int sublistSize = i < largerParts ? partSize + 1 : partSize;
      if (sublistSize == 0) {
        result[i] = null;
      } else {
        ListNode? sublistHead = current;
        ListNode tail = current!;
        for (int j = 0; j < sublistSize - 1; j++) {
          tail = tail.next!;
        }
        ListNode? nextNode = tail.next;
        tail.next = null;
        result[i] = sublistHead;
        current = nextNode;
      }
    }
    
    return result;
  }
}
