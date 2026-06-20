class Solution {
    fun removeElements(head: ListNode?, `val`: Int): ListNode? {
        val dummy = ListNode(0)
        dummy.next = head
        var cur: ListNode? = dummy
        while (cur?.next != null) {
            if (cur.next!!.`val` == `val`) cur.next = cur.next!!.next else cur = cur.next
        }
        return dummy.next
    }
}
