class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        ptr = temp = head
        for _ in range(n):
            ptr = ptr.next
            
        if not ptr:
            return head.next
            
        while ptr.next:
            ptr = ptr.next
            temp = temp.next
            
        temp.next = temp.next.next
        return head