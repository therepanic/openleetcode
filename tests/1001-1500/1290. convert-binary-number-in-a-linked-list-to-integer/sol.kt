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
    fun getDecimalValue(head: ListNode?): Int {
        var num = 0
        var curr = head
        while (curr != null) {
            num = (num shl 1) or curr.`val`
            curr = curr.next
        }
        return num
    }
}
