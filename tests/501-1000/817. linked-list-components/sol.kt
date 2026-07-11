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
    fun numComponents(head: ListNode?, nums: IntArray): Int {
        val nodeSet = nums.toHashSet()
        var count = 0
        var inComponent = false
        var current = head
        while (current != null) {
            if (current.`val` in nodeSet) {
                if (!inComponent) {
                    count++
                    inComponent = true
                }
            } else {
                inComponent = false
            }
            current = current.next
        }
        return count
    }
}
