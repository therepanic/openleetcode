class Solution:
    def recoverArray(self, nums: List[int]) -> List[int]:
        nums.sort()
        cnt = Counter(nums)
        for i in range(1, len(nums)): 
            diff = nums[i] - nums[0]
            if diff and diff&1 == 0: 
                ans = []
                freq = cnt.copy()
                for k, v in freq.items(): 
                    if v: 
                        if freq[k+diff] < v: break 
                        ans.extend([k+diff//2]*v)
                        freq[k+diff] -= v
                else: return ans