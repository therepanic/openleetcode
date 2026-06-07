class Solution:
    def combinationSum(self, candidates, target):
        res = []

        def make_combination(idx, comb, total):
            if total == target:
                res.append(comb[:])
                return

            if total > target or idx >= len(candidates):
                return

            comb.append(candidates[idx])
            make_combination(idx, comb, total + candidates[idx])
            comb.pop()
            make_combination(idx + 1, comb, total)

        make_combination(0, [], 0)
        return res
