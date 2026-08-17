class Solution:
    def numSplits(self, s: str) -> int:
        n = len(s)
        counter = 0
        distinct_left = defaultdict(int)
        distinct_right = defaultdict(int)

        for c in s:
            distinct_right[c] += 1
        for i in range(0, n - 1):
            distinct_left[s[i]] += 1
            distinct_right[s[i]] -= 1
            if distinct_right[s[i]] == 0:
                distinct_right.pop(s[i])
            if len(distinct_left) == len(distinct_right):
                counter += 1

        return counter
