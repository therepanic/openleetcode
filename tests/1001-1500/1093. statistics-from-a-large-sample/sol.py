class Solution:
    def sampleStats(self, count: list[int]) -> list[float]:
        def kth(k):
            acc = 0
            for v, c in enumerate(count):
                acc += c
                if acc >= k:
                    return v

        tot, cnt = 0, 0
        mini, maxi = None, None
        mode, modeCnt = 0, 0

        for v, c in enumerate(count):
            if c:
                if mini is None:
                    mini = v
                maxi = v
                tot += c
                cnt += v * c
                if c > modeCnt:
                    modeCnt = c
                    mode = v

        if tot % 2 == 1:
            m = kth(tot // 2 + 1)
        else:
            m = (kth(tot // 2) + kth(tot // 2 + 1)) / 2

        return [float(mini), float(maxi), cnt / tot, float(m), float(mode)]
