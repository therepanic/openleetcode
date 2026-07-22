class Solution(object):
    def getStrongest(self, ns, k):

        ns = sorted(ns)
        mi = (len(ns) - 1) // 2
        cnt = ns[mi]

        i1 = 0
        i2 = len(ns) - 1

        a = []
        for _ in range(k):
            if abs(ns[i2] - cnt) >= abs(ns[i1] - cnt):
                a.append(ns[i2])
                i2 -= 1
            else:
                a.append(ns[i1])
                i1 += 1

        return a
