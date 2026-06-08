class Solution {
    fun reverseKGroup(head: ListNode?, k: Int): ListNode? {
        val dummy = ListNode(0)
        dummy.next = head
        var groupPrev: ListNode? = dummy
        while (true) {
            val kth = getKthNode(groupPrev, k) ?: break
            val groupNext = kth.next
            var prev = groupNext
            var cur = groupPrev!!.next
            while (cur != groupNext) {
                val tmp = cur!!.next
                cur.next = prev
                prev = cur
                cur = tmp
            }
            val tmp = groupPrev.next
            groupPrev.next = kth
            groupPrev = tmp
        }
        return dummy.next
    }

    private fun getKthNode(start: ListNode?, k: Int): ListNode? {
        var node = start
        var steps = k
        while (node != null && steps > 0) {
            node = node.next
            steps--
        }
        return node
    }
}
