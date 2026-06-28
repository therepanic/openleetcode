/**
 * Example:
 * var li = ListNode(5)
 * var v = li.`val`
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */
class Solution {
    fun splitListToParts(head: ListNode?, k: Int): Array<ListNode?> {
        // Step 1: Calculate the length of the linked list
        var length = 0
        var current = head
        while (current != null) {
            length++
            current = current.next
        }
        
        // Step 2: Determine the size of each part
        val partSize = length / k
        val largerParts = length % k
        
        // Initialize an array to store the results
        val result = arrayOfNulls<ListNode>(k)
        
        // Step 3: Split the linked list into parts
        current = head
        for (i in 0 until k) {
            val sublistSize = if (i < largerParts) partSize + 1 else partSize
            if (sublistSize == 0) {
                result[i] = null
            } else {
                val sublistHead = current
                for (j in 0 until sublistSize - 1) {
                    current = current!!.next
                }
                val nextNode = current!!.next
                current!!.next = null
                result[i] = sublistHead
                current = nextNode
            }
        }
        
        return result
    }
}
