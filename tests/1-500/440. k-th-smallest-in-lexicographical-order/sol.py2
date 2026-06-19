class Solution(object):
    def findKthNumber(self, n, k):
        return self.solve(0, n, k)

    def solve(self, current, n, k):
        if k == 0:
            return current // 10

        for i in range(max(current, 1), current + 10):
            count = self.numOfChildren(i, i + 1, n)
            if count >= k:
                return self.solve(i * 10, n, k - 1)
            k -= count

        return -1  

    def numOfChildren(self, current, neighbour, n):
        if neighbour > n:
            if current > n:
                return 0
            return n - current + 1
        return (neighbour - current) + self.numOfChildren(current * 10, neighbour * 10, n)
