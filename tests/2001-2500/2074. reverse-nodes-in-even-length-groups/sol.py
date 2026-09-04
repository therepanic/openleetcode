# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution(object):
    def reverseEvenLengthGroups(self, head):
        """
        :type head: Optional[ListNode]
        :rtype: Optional[ListNode]
        """
        dummy = ListNode(0)
        dummy.next = head

        group_size = 1
        prev = dummy
        curr = head

        while curr:
            count = 0
            temp = curr
            while temp and count < group_size:
                temp = temp.next
                count += 1

            if count % 2 == 0:
                prev_next = prev.next
                node = curr
                prev_node = None
                for _ in range(count):
                    nxt = node.next
                    node.next = prev_node
                    prev_node = node
                    node = nxt

                prev.next = prev_node
                prev_next.next = node
                prev = prev_next
                curr = node
            else:
                for _ in range(count):
                    prev = curr
                    curr = curr.next

            group_size += 1

        return dummy.next