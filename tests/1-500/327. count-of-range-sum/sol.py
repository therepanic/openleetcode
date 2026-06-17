from sortedcontainers import SortedList

class Solution:
    def countRangeSum(self, nums: List[int], lower: int, upper: int) -> int:
        psum = [0]
        for num in nums:
            psum.append(psum[-1] + num)

        slist = SortedList()
        result = 0
        for pval in reversed(psum):
            result += slist.bisect_right(pval + upper) - slist.bisect_left(pval + lower)
            slist.add(pval)

        return result
