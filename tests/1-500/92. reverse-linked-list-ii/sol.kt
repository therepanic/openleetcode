class Solution {
    fun reverseBetween(head: ListNode?, left: Int, right: Int): ListNode? {
        val dummy = ListNode(0)
        dummy.next = head
        var prev: ListNode? = dummy

        repeat(left - 1) {
            prev = prev?.next
        }

        val current = prev?.next
        repeat(right - left) {
            val node = current?.next
            current?.next = node?.next
            node?.next = prev?.next
            prev?.next = node
        }

        return dummy.next
    }
}
