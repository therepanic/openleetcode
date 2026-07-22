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
    fun removeZeroSumSublists(head: ListNode?): ListNode? {
        val dummy = ListNode(0)
        dummy.next = head
        var prefixSum = 0
        val seen = mutableMapOf<Int, ListNode>()

        var curr: ListNode? = dummy
        while (curr != null) {
            prefixSum += curr.`val`
            seen[prefixSum] = curr
            curr = curr.next
        }

        prefixSum = 0
        curr = dummy
        while (curr != null) {
            prefixSum += curr.`val`
            curr.next = seen[prefixSum]!!.next
            curr = curr.next
        }

        return dummy.next
    }
}
