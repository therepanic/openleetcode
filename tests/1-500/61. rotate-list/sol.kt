class Solution {
    fun rotateRight(head: ListNode?, k: Int): ListNode? {
        if (head?.next == null || k == 0) {
            return head
        }

        var len = 1
        var tail = head
        while (tail!!.next != null) {
            tail = tail.next
            len++
        }

        val shift = k % len
        if (shift == 0) {
            return head
        }

        tail.next = head
        val steps = len - shift
        var newTail = head
        for (i in 1 until steps) {
            newTail = newTail!!.next
        }

        val newHead = newTail!!.next
        newTail.next = null
        return newHead
    }
}
