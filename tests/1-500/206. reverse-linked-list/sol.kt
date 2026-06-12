class Solution {
    fun reverseList(head: ListNode?): ListNode? {
        var current = head
        var prev: ListNode? = null
        while (current != null) {
            val next = current.next
            current.next = prev
            prev = current
            current = next
        }
        return prev
    }
}
