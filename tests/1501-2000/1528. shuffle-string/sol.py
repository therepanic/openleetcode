class Solution:
    def restoreString(self, s: str, indices: List[int]) -> str:
        res = [0] * len(indices)
        for i in range(len(indices)):
            res[indices[i]] = s[i]

        res = "".join(map(str, res))
        return res
