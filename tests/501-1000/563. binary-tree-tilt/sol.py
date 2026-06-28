class Solution(object):
    def findTilt(self, root):
        self.ans = 0

        def helper(n):
            if not n:
                return 0
            l = helper(n.left)
            r = helper(n.right)
            self.ans += abs(l - r)
            return l + r + n.val

        helper(root)
        return self.ans
