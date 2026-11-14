class Solution:
    def minimumDeletions(self, a: List[int]) -> int:
        n,i,j = len(a),*sorted([a.index(min(a)),a.index(max(a))])
        return min(j+1,n-i,i+1+n-j)