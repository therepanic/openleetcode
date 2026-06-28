class Solution:
    def nextGreatestLetter(self, letters: List[str], target: str) -> str:
        res = letters[0]
        flag = False

        for ch in letters:
            if not flag:
                if ch > target:
                    res = ch
                    flag = not flag
            else:
                if ch > target and ch < res:
                    res = ch

        return res
