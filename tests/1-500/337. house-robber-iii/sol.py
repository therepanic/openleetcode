class Solution(object):
    def rob(self, root):
        def opulence(estate):
            if not estate: return 0, 0
            l1, l2 = opulence(estate.left)
            r1, r2 = opulence(estate.right)
            lush = estate.val + l2 + r2
            lavish = max(l1, l2) + max(r1, r2)
            return lush, lavish
        return max(opulence(root))