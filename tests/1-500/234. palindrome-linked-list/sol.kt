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
    fun isPalindrome(head: ListNode?): Boolean {
        var slow = head
        var fast = head
        
        // Step 1
        while (fast != null && fast.next != null) {
            val nextFast = fast.next
            fast = nextFast?.next
            slow = slow!!.next
        }
        
        // Step 2
        var node: ListNode? = null
        while (slow != null) {
            val temp = slow.next
            slow.next = node
            node = slow
            slow = temp
        }
        
        // Step 3
        var first = head
        var second = node
        while (second != null) {
            if (first!!.`val` != second.`val`) {
                return false
            }
            first = first.next
            second = second.next
        }
        
        return true
    }
}
