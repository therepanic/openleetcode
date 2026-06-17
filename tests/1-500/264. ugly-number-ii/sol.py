class Solution(object):
    def nthUglyNumber(self, n):
        h = [1]
        i = j = k = 0

        for _ in range(n - 1):
            m = min(h[i] * 2, h[j] * 3, h[k] * 5)
            h.append(m)

            if m == h[i] * 2:
                i += 1
            if m == h[j] * 3:
                j += 1
            if m == h[k] * 5:
                k += 1

        return h[-1]