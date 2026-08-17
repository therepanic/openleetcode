class Solution(object):
    def getMaximumGenerated(self, n):
        if n == 0:
            return 0
        elif n == 2 or n == 1:
            return 1
        else:
            a = [0, 1]
            v = 1
            for i in range(2, n + 1):
                if i % 2 == 0:
                    a.append(a[v])
                else:
                    a.append(a[v] + a[v + 1])
                    v += 1
        return max(a)
