class Solution:
    def swapNodes(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        if head is None or head.next is None:
            return head

        temp = head
        first_prev = None

        # Find the k-th node from the beginning
        n = 1
        while n < k:
            first_prev = temp
            temp = temp.next
            n += 1

        first = temp

        # Find the k-th node from the end
        second = head
        second_prev = None
        temp = first
        while temp.next:
            second_prev = second
            temp = temp.next
            second = second.next

        # Change prev -> cur links
        if first_prev:
            first_prev.next = second
        if second_prev:
            second_prev.next = first

        # Change cur -> next links
        temp = first.next
        first.next = second.next
        second.next = temp

        # Handle special cases
        if k == 1:
            return second
        if second == head:
            return first

        return head
