# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeInBetween(
        self, list1: ListNode, a: int, b: int, list2: ListNode
    ) -> ListNode:
        curr = list1

        for i in range(a - 1):
            curr = curr.next

        prev = curr

        for i in range(b - a + 2):
            curr = curr.next

        prev.next = list2
        prev = prev.next

        while prev.next:
            prev = prev.next
        prev.next = curr

        return list1
