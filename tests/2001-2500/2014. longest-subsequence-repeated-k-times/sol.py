class Solution:
    def longestSubsequenceRepeatedK(self, s: str, k: int) -> str:
        def isK(sub: str, t: str, k: int) -> bool:
            count = i = 0
            for ch in t:
                if i < len(sub) and ch == sub[i]:
                    i += 1
                    if i == len(sub):
                        i = 0
                        count += 1
                        if count == k:
                            return True
            return False

        res = ""
        q = deque([""])
        while q:
            curr = q.popleft()
            for ch in map(chr, range(ord("a"), ord("z") + 1)):
                nxt = curr + ch
                if isK(nxt, s, k):
                    res = nxt
                    q.append(nxt)
        return res
