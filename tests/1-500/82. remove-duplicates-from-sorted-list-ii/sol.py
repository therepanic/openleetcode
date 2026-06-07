class Solution:
    def deleteDuplicates(self, head):
        dummy = ListNode(-1)
        dummy.next = head
        prev = dummy
        cur = head

        while cur and cur.next:
            if cur.val == cur.next.val:
                while cur.next and cur.val == cur.next.val:
                    cur = cur.next
                prev.next = cur.next  # Skip all duplicates
            else:
                prev = prev.next  # Move to next distinct node
            cur = cur.next

        return dummy.next
