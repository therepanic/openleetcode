class Solution:
    def minimizeTheDifference(self, mat: List[List[int]], target: int):
        dp = {}
        self.mini = float("inf")
        for row in mat:
            row.sort()

        def func(i, ans):
            if i < 0:
                self.mini = min(self.mini, abs(ans))
                return abs(ans)
            if (i, ans) in dp:
                return dp[(i, ans)]
            if ans < 0 and abs(ans) > self.mini:
                return float("inf")
            take = float("inf")
            for z in range(len(mat[i])):
                if z > 0 and mat[i][z] == mat[i][z - 1]:
                    continue
                take = min(take, func(i - 1, ans - mat[i][z]))
                if take == 0:
                    break
            dp[(i, ans)] = take
            return take

        return func(len(mat) - 1, target)
