class Solution:
    def maxRunTime(self, n: int, batteries: List[int]) -> int:
        l, r, ans=min(batteries), sum(batteries)//n, 0
        while l<=r:
            mid=(l+r)>>1
            reserve=0
            for x in batteries: reserve+=min(x, mid)
            if reserve>=mid*n:
                ans=mid
                l=mid+1
            else:
                r=mid-1
        return ans