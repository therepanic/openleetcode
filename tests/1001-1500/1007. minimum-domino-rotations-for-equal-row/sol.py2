class Solution(object):
    def minDominoRotations(self, tops, bottoms):
        n = len(tops)
        res = float('inf')
        face = [0]*7
        for i in range(n):
            face[tops[i]] += 1
            if bottoms[i] != tops[i]:
                face[bottoms[i]] += 1
        for x in range(1, 7):
            if face[x] < n:
                continue
            maintainTop = maintainBottom = 0
            possible = True
            for i in range(n):
                if tops[i] != x:
                    maintainTop += 1
                if bottoms[i] != x:
                    maintainBottom += 1
            if possible:
                res = min(res, maintainTop, maintainBottom)
        return -1 if res == float('inf') else res
