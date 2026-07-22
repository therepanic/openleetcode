import heapq


class Solution:
    def minSetSize(self, arr):
        freq = {}
        for num in arr:
            freq[num] = freq.get(num, 0) + 1

        maxHeap = [-val for val in freq.values()]
        heapq.heapify(maxHeap)

        sumRemoved = 0
        minSetSize = 0
        while sumRemoved < len(arr) // 2:
            sumRemoved += -heapq.heappop(maxHeap)
            minSetSize += 1
        return minSetSize
