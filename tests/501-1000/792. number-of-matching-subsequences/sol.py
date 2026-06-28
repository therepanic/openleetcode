import bisect
from collections import defaultdict
from typing import List


class Solution:
    def numMatchingSubseq(self, s: str, words: List[str]) -> int:
        # 50*5000 ->25*10**4
        # maybe bisect skippin
        n = len(s)
        mp = defaultdict(list)
        for i, val in enumerate(s):
            mp[val].append(i)
        for val in range(26):
            mp[chr(ord("a") + val)].append(n)
            mp[chr(ord("a") + val)].sort()

        def found(word):
            curr = -1
            for i, val in enumerate(word):
                if curr >= n:
                    return False
                idx = bisect.bisect_left(mp[val], curr + 1)
                curr = mp[val][idx]
                # print(f"found {val} at {mp[val][idx]}")
            return True if curr < n else False

        cnt = 0
        for word in words:
            if found(word):
                # print(word)
                # print()
                cnt += 1
        return cnt
