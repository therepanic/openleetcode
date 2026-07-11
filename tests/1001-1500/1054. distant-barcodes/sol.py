class Solution(object):
    def rearrangeBarcodes(self, barcodes):
        h = {}
        for i in barcodes:
            if str(i) not in h:
                h[str(i)] = 0
            h[str(i)] += 1
        heap = []
        l = []
        for i, j in h.items():
            heapq.heappush(heap, [-j, i])
        while len(heap) > 1:
            x = heapq.heappop(heap)
            y = heapq.heappop(heap)

            l.append(int(x[1]))
            l.append(int(y[1]))
            x[0] = x[0] + 1
            y[0] = y[0] + 1
            if x[0] == 0:
                pass
            else:
                heapq.heappush(heap, x)
            if y[0] == 0:
                pass
            else:
                heapq.heappush(heap, y)
        if len(heap) == 0:
            pass
        else:
            l.append(int(heap[0][1]))
        return l
