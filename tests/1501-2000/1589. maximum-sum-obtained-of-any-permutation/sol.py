from typing import List


class Solution:
    def maxSumRangeQuery(self, nums: List[int], requests: List[List[int]]) -> int:
        events: list[tuple[int, int]] = []
        mod: int = int(1e9 + 7)

        for i in range(0, len(requests)):
            start: int = requests[i][0]
            end: int = requests[i][1]

            events.append((start, 1))
            events.append((end + 1, -1))

        events.sort()

        cnt: int = 0
        prev: int = -1

        weight: dict[int, int] = dict()
        for i in range(0, len(events)):
            if prev != -1 and cnt != 0:
                weight[cnt] = weight.get(cnt, 0) + events[i][0] - prev

            prev = events[i][0]
            cnt += events[i][1]

        weight_list = sorted(weight.items(), key=lambda x: x[0], reverse=True)

        i: int = 0
        nums.sort(reverse=True)
        ans: int = 0

        for wg, num in weight_list:
            while num != 0:
                ans = (ans + (nums[i] * wg) % mod) % mod
                num -= 1
                i += 1

        return ans
