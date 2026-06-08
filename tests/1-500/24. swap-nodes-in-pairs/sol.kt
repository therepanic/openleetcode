class Solution {
    fun swapPairs(head: ListNode?): ListNode? {
        if (head?.next == null) return head
        val second = head.next!!
        head.next = swapPairs(second.next)
        second.next = head
        return second
    }
}
