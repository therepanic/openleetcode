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
    fun addTwoNumbers(l1: ListNode?, l2: ListNode?): ListNode? {
        var s1 = ""
        var p = l1
        while (p != null) {
            s1 += p.`val`.toString()
            p = p.next
        }

        var s2 = ""
        var q = l2
        while (q != null) {
            s2 += q.`val`.toString()
            q = q.next
        }

        val n1 = s1.toBigInteger()
        val n2 = s2.toBigInteger()
        val r = (n1 + n2).toString()

        val dummy = ListNode(0)
        var cur = dummy

        for (x in r) {
            cur.next = ListNode(x - '0')
            cur = cur.next!!
        }

        return dummy.next
    }
}
