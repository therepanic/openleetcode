class Solution:
    def combinationSum2(self, candidates, target):
        candidates.sort()

        ans = []

        def backTrack(curr, pos, target):
            if target == 0:
                ans.append(curr[:])

            if target <= 0:
                return

            prev = -1
            for i in range(pos, len(candidates)):
                if candidates[i] == prev:
                    continue
                curr.append(candidates[i])
                backTrack(curr, i + 1, target - candidates[i])
                curr.pop()
                prev = candidates[i]

        backTrack([], 0, target)
        return ans


# Time Complexity  : O(2^N)
# Space Complexity : O(N)
# by ar-sayeem [May 07, 2026]
