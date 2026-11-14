class Solution:
    def pairSum(self, head: Optional[ListNode]) -> int:
        values = []
        node = head
        while node:
            values.append(node.val)
            node = node.next
        return max(values[i] + values[-1 - i] for i in range(len(values) // 2))
