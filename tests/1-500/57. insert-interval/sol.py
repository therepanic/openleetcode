class Solution:
    def insert(self, intervals, newInterval):
        res = []
        i = 0
        n = len(intervals)

        new_start, new_end = newInterval

        # 1. LEFT
        while i < n and intervals[i][1] < new_start:
            res.append(intervals[i])
            i += 1

        # 2. MERGE
        while i < n and intervals[i][0] <= new_end:
            new_start = min(new_start, intervals[i][0])
            new_end = max(new_end, intervals[i][1])
            i += 1

        res.append([new_start, new_end])

        # 3. RIGHT
        while i < n:
            res.append(intervals[i])
            i += 1

        return res