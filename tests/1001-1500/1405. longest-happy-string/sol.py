import heapq


class Solution:
    def longestDiverseString(self, a: int, b: int, c: int) -> str:
        heap = []
        res = []
        for count, char in zip([a, b, c], ["a", "b", "c"]):
            if count > 0:
                heapq.heappush(heap, (-count, char))

        while heap:
            count, char = heapq.heappop(heap)
            if len(res) >= 2 and res[-2] == res[-1] == char:
                if not heap:
                    break
                count_2, char_2 = heapq.heappop(heap)
                res.append(char_2)
                count_2 += 1
                if count_2 < 0:
                    heapq.heappush(heap, (count_2, char_2))
            else:
                res.append(char)
                count += 1

            if count < 0:
                heapq.heappush(heap, (count, char))

        return "".join(res)
