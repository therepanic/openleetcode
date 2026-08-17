class Solution(object):
    def maximumPopulation(self, logs):
        l = len(logs)
        a = []
        r = 0
        y = 0
        for i in logs:
            a.append(i[0])
        for j in range(l):
            c = 0
            for k in range(l):
                if a[j] >= logs[k][0] and a[j] < logs[k][1] and j != k:
                    c += 1
            if c > r:
                r = c
                y = a[j]
            if c == r and r > 0:
                if a[j] < y:
                    y = a[j]
        if y == 0:
            return min(a)
        return y
