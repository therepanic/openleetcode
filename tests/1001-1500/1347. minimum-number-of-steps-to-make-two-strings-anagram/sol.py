class Solution:
    def minSteps(self, s: str, t: str) -> int:
        dic = {}

        for ch in t:
            dic[ch] = dic.get(ch, 0) + 1

        for ch in s:
            if ch in dic and dic[ch] > 0:
                dic[ch] -= 1

        return sum(dic.values())
