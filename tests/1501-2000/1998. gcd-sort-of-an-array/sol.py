class UnionFind:
    def __init__(self, n):
        self.P = [i for i in range(n)]
        self.S = [1] * n

    def Find(self, node):
        if self.P[node] != node:
            self.P[node] = self.Find(self.P[node])
        return self.P[node]

    def Connected(self, x, y):
        return self.Find(x) == self.Find(y)

    def Union(self, x, y):
        pX, pY = self.Find(x), self.Find(y)

        if pX != pY:
            if self.S[pX] < self.S[pY]:
                self.P[pX] = pY
                self.S[pY] += self.S[pX]
            else:
                self.P[pY] = pX
                self.S[pX] += self.S[pY]


class Solution:
    def gcdSort(self, nums):
        A = nums

        G = UnionFind(max(A) + 1)

        for num in A:
            n, i = num, 2
            while i * i <= n:
                if not n % i:
                    G.Union(i, num)
                    while not n % i:
                        n //= i
                i += 1
            if n > 1:
                G.Union(n, num)

        for a, b in zip(A, sorted(A)):
            if not G.Connected(a, b):
                return False
        return True
