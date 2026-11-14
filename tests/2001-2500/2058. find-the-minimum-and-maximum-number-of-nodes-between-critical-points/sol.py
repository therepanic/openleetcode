class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def nodesBetweenCriticalPoints(self, head):
        if not head or not head.next or not head.next.next:
            return [-1, -1]
        prev, curr, ahead = head, head.next, head.next.next
        counter = 2
        minDis = float('inf')
        firstCritical = -1
        lastCritical = -1
        while ahead:
            if (curr.val > prev.val and curr.val > ahead.val) or \
               (curr.val < prev.val and curr.val < ahead.val):
                if firstCritical == -1:
                    firstCritical = counter
                    lastCritical = counter
                else:
                    minDis = min(minDis, counter - lastCritical)
                    lastCritical = counter
            counter += 1
            prev, curr, ahead = curr, ahead, ahead.next
        if minDis == float('inf'):
            return [-1, -1]
        return [minDis, lastCritical - firstCritical]