import heapq


class Solution:
    def minimumDeviation(self, nums: List[int]) -> int:
        if not nums:
            return float("inf")

        evens = []
        min_val = float("inf")

        for num in nums:
            if num % 2 == 0:
                heapq.heappush(evens, -num)
                min_val = min(num, min_val)
            else:
                heapq.heappush(evens, -num * 2)
                min_val = min(num * 2, min_val)

        res = float("inf")
        while evens[0] % 2 == 0:
            max_val = -heapq.heappop(evens)
            res = min(res, max_val - min_val)
            new_num = max_val // 2
            heapq.heappush(evens, -new_num)
            min_val = min(new_num, min_val)

        res = min(-evens[0] - min_val, res)
        return res
