class Solution:
    def maxConsecutiveAnswers(self, answerKey: str, k: int) -> int:
        l = 0
        r = 0
        falseCnt = 0
        trueCnt = 0
        result = 0
        n = len(answerKey)
        while r < n:
            if answerKey[r] == "T":
                trueCnt += 1
            if answerKey[r] == "F":
                falseCnt += 1
            while trueCnt > k and falseCnt > k:
                if answerKey[l] == "T":
                    trueCnt -= 1
                if answerKey[l] == "F":
                    falseCnt -= 1
                l += 1
            result = max(result, r - l + 1)
            r += 1
        return result
