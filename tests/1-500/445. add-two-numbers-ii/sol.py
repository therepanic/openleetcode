class Solution(object):
    def addTwoNumbers(self, l1, l2):
        s1 = ""
        while l1:
            s1 += str(l1.val)
            l1 = l1.next

        s2 = ""
        while l2:
            s2 += str(l2.val)
            l2 = l2.next

        r = str(int(s1) + int(s2))
        dummy = ListNode(0)
        cur = dummy

        for x in r:
            cur.next = ListNode(int(x))
            cur = cur.next

        return dummy.next
