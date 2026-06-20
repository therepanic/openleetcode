class Solution(object):
    def maximumGap(self, nums):
        if len(nums) < 2:
            return 0

        min_num, max_num = min(nums), max(nums)
        if min_num == max_num:
            return 0

        gap = max(1, (max_num - min_num) // (len(nums) - 1))
        buckets = [[None, None] for _ in range((max_num - min_num) // gap + 1)]

        for num in nums:
            idx = (num - min_num) // gap
            if buckets[idx][0] is None:
                buckets[idx][0] = buckets[idx][1] = num
            else:
                buckets[idx][0] = min(buckets[idx][0], num)
                buckets[idx][1] = max(buckets[idx][1], num)

        max_gap = 0
        prev_max = min_num

        for bucket in buckets:
            if bucket[0] is not None:
                max_gap = max(max_gap, bucket[0] - prev_max)
                prev_max = bucket[1]

        return max_gap
