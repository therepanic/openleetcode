class Solution:
    def countRangeSum(self, nums: List[int], lower: int, upper: int) -> int:
        prefix = [0]
        for num in nums:
            prefix.append(prefix[-1] + num)

        buffer = [0] * len(prefix)

        def sort_count(left: int, right: int) -> int:
            if right - left <= 1:
                return 0

            mid = left + (right - left) // 2
            count = sort_count(left, mid) + sort_count(mid, right)

            low = high = mid
            for i in range(left, mid):
                while low < right and prefix[low] - prefix[i] < lower:
                    low += 1
                while high < right and prefix[high] - prefix[i] <= upper:
                    high += 1
                count += high - low

            p1, p2, idx = left, mid, left
            while p1 < mid and p2 < right:
                if prefix[p1] <= prefix[p2]:
                    buffer[idx] = prefix[p1]
                    p1 += 1
                else:
                    buffer[idx] = prefix[p2]
                    p2 += 1
                idx += 1
            while p1 < mid:
                buffer[idx] = prefix[p1]
                p1 += 1
                idx += 1
            while p2 < right:
                buffer[idx] = prefix[p2]
                p2 += 1
                idx += 1
            prefix[left:right] = buffer[left:right]
            return count

        return sort_count(0, len(prefix))
