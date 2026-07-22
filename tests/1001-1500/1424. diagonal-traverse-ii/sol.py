class Solution:
    def findDiagonalOrder(self, n):
        l = []
        for i in range(len(n)):
            for j in range(len(n[i])):
                l.append([i + j, i, j])

        h = {}
        for i in l:
            if i[0] not in h:
                h[i[0]] = []
            h[i[0]].append(n[i[1]][i[2]])

        heap = []
        for i in sorted(h):
            heap.extend(h[i][::-1])
        return heap
