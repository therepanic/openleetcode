class Solution {
    fun addTwoNumbers(l1: ListNode?, l2: ListNode?): ListNode? {
        val dummy = ListNode(0)
        var cur: ListNode? = dummy
        var a = l1
        var b = l2
        var carry = 0

        while (a != null || b != null || carry != 0) {
            val x = a?.`val` ?: 0
            val y = b?.`val` ?: 0
            val total = x + y + carry
            carry = total / 10
            cur!!.next = ListNode(total % 10)
            cur = cur.next
            a = a?.next
            b = b?.next
        }

        return dummy.next
    }
}
