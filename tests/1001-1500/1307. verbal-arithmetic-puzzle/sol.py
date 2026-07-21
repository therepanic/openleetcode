class Solution:
    def isSolvable(self, wL: List[str], res: str) -> bool:
        zeroes = set()
        m = 0
        for word in wL:
            if len(word) > 1:
                zeroes.add(word[0])
            m = max(m, len(word))
        if m > len(res):
            return False
        d = {i: -1 for word in wL + [res] for i in word}
        wL = [word[::-1] for word in wL]
        res = res[::-1]
        R = len(res)
        N = len(wL)
        visited = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0}

        def rec(wi, ri, rem):
            if ri == R:
                return rem == 0 and (len(res) == 1 or d[res[R - 1]] != 0)
            if wi == N:
                if d[res[ri]] != -1:
                    if d[res[ri]] != rem % 10:
                        return False
                    else:
                        return rec(0, ri + 1, rem // 10)
                elif rem % 10 in visited:
                    val = rem % 10
                    visited.remove(val)
                    d[res[ri]] = val
                    ret = rec(wi, ri, rem)
                    d[res[ri]] = -1
                    visited.add(val)
                    if ret:
                        return True
                return False
            if len(wL[wi]) <= ri:
                return rec(wi + 1, ri, rem)
            if d[wL[wi][ri]] != -1:
                return rec(wi + 1, ri, rem + d[wL[wi][ri]])
            for val in range(0, 10):
                if val in visited and (val != 0 or wL[wi][ri] not in zeroes):
                    visited.remove(val)
                    d[wL[wi][ri]] = val
                    ret = rec(wi + 1, ri, rem + val)
                    d[wL[wi][ri]] = -1
                    visited.add(val)
                    if ret:
                        return True
            return False

        return rec(0, 0, 0)
