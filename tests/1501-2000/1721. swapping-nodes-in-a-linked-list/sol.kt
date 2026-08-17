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
    fun swapNodes(head: ListNode?, k: Int): ListNode? {
        if (head == null || head.next == null) {
            return head
        }

        var temp = head
        var firstPrev: ListNode? = null

        var n = 1
        while (n < k) {
            firstPrev = temp
            temp = temp?.next
            n++
        }

        val first = temp

        var second = head
        var secondPrev: ListNode? = null
        temp = first
        while (temp?.next != null) {
            secondPrev = second
            temp = temp.next
            second = second?.next
        }

        firstPrev?.next = second
        secondPrev?.next = first

        val tempNext = first?.next
        first?.next = second?.next
        second?.next = tempNext

        if (k == 1) {
            return second
        }
        if (second == head) {
            return first
        }

        return head
    }
}
