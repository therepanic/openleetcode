class Pair:
    def __init__(self, start, end, profit):
        self.start = start
        self.end = end
        self.profit = profit


class Solution:
    def BS(self, index, n, arr):
        l, h = index + 1, n - 1
        idx = -1

        while l <= h:
            mid = l + (h - l) // 2

            if arr[mid].start >= arr[index].end:
                idx = mid
                h = mid - 1
            else:
                l = mid + 1

        return idx

    def dfs(self, index, n, arr):
        if index >= n or index == -1:
            return 0
        if self.dp[index] != -1:
            return self.dp[index]

        notTake = self.dfs(index + 1, n, arr)

        # next index whose start time is just greater than endTime of current index
        nextIndex = self.BS(index, n, arr)
        take = arr[index].profit + self.dfs(nextIndex, n, arr)

        self.dp[index] = max(take, notTake)
        return self.dp[index]

    def jobScheduling(self, start, end, profit):
        n = len(start)
        arr = []
        self.dp = [-1] * (n + 1)

        for i in range(n):
            arr.append(Pair(start[i], end[i], profit[i]))

        arr.sort(key=lambda x: x.start)
        return self.dfs(0, n, arr)
