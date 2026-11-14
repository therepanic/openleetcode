class Solution:
    def maxDistance(self, colors: List[int]) -> int:
        n=len(colors)
        c0, cN=colors[0], colors[-1]
        lMax, rMax=0, 0
        for i, c in enumerate(colors):
            if c0!=c: lMax=max(lMax, i)
            if cN!=c: rMax=max(rMax, n-1-i)
        return max(lMax, rMax)