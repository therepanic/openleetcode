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
    fun mergeInBetween(list1: ListNode?, a: Int, b: Int, list2: ListNode?): ListNode? {
        var curr = list1
        for (i in 0 until a-1) {
            curr = curr?.next
        }
        var prev = curr
        for (i in 0 until b-a+2) {
            curr = curr?.next
        }
        prev?.next = list2
        prev = prev?.next
        while (prev?.next != null) {
            prev = prev.next
        }
        prev?.next = curr
        return list1
    }
}
