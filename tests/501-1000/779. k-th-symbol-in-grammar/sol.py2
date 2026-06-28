class Solution(object):
    def kthGrammar(self, n, k):
        if n == 1:
            return 0
        parent = self.kthGrammar(n - 1, (k + 1) // 2)
        return parent if k % 2 == 1 else 1 - parent
