from sortedcontainers import SortedList
class Solution:
    def countSmaller(self, nums: List[int]) -> List[int]:
        
        sorted_list = SortedList()
        ans = []
        for n in reversed(nums):
            ans.append(sorted_list.bisect_left(n))
            sorted_list.add(n)
        ans.reverse()
        return ans