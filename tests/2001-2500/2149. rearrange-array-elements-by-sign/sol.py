class Solution:
    def rearrangeArray(self, nums: List[int]) -> List[int]:
        pos, neg = [], []

        for n in nums:
            if n > 0:
                pos.append(n)
            else:
                neg.append(n)
        
        res = [0] * len(nums)
        res[0 : len(pos) * 2 : 2] = pos
        res[1 : len(neg) * 2 : 2] = neg

        return res