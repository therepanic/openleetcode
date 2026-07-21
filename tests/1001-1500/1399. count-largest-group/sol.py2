class Solution(object):
    def countLargestGroup(self, n):
        mpp = {}
        maxi, count = 0, 0

        for i in range(1, n + 1):
            x = self.digsum(i)
            mpp[x] = mpp.get(x, 0) + 1
            maxi = max(maxi, mpp[x])

        for v in mpp.values():
            if v == maxi:
                count += 1
        return count

    def digsum(self, n):
        s = 0
        while n:
            s += n % 10
            n //= 10
        return s
