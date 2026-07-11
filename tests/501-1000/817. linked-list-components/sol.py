class Solution(object):
    def numComponents(self, head, nums):
        node_set = set(nums)
        count = 0
        in_component = False
        while head:
            if head.val in node_set:
                if not in_component:
                    count += 1
                    in_component = True
            else:
                in_component = False
            head = head.next
        return count
