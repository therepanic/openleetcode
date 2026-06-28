from collections import Counter


class Solution(object):
    def findFrequentTreeSum(self, root):
        c = Counter()

        def s(n):
            if not n:
                return 0
            r = n.val + s(n.left) + s(n.right)
            c[r] += 1
            return r

        s(root)
        m = max(c.values())
        return [k for k, v in c.items() if v == m]
