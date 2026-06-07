class Solution {
    fun removeNthFromEnd(head: ListNode?, n: Int): ListNode? {
        val dummy = ListNode(0)
        dummy.next = head
        var fast: ListNode? = dummy
        var slow: ListNode? = dummy

        repeat(n) {
            fast = fast?.next
        }

        while (fast?.next != null) {
            fast = fast?.next
            slow = slow?.next
        }

        slow?.next = slow?.next?.next
        return dummy.next
    }
}
