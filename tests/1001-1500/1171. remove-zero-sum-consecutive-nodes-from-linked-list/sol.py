# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def removeZeroSumSublists(self, head):
        """
        :type head: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
        dummy = ListNode(0)
        dummy.next = head
        prefix_sum = 0
        seen = {}

        curr = dummy
        while curr:
            prefix_sum += curr.val
            seen[prefix_sum] = curr
            curr = curr.next

        prefix_sum = 0
        curr = dummy
        while curr:
            prefix_sum += curr.val
            curr.next = seen[prefix_sum].next
            curr = curr.next

        return dummy.next
