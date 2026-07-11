class Solution:
    def isNStraightHand(self, hand: List[int], groupSize: int) -> bool:
        hashmap = {}
        for h in hand:
            hashmap[h] = hashmap.get(h, 0) + 1

        minHeap = list(hashmap.keys())
        heapq.heapify(minHeap)

        while minHeap:
            first = minHeap[0]
            for i in range(first, first + groupSize):
                if i not in hashmap:
                    return False

                hashmap[i] -= 1

                if hashmap[i] == 0:
                    if i != minHeap[0]:
                        return False
                    heapq.heappop(minHeap)
        return True
