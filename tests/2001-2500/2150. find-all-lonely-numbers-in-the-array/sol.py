class Solution(object):
    def findLonely(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        res = []

        freq = {}

        for x in range(len(nums)):
            if nums[x] in freq:
                freq[nums[x]]+=1
            else:
                freq[nums[x]]=1

        for frequency,value in freq.items():
            if value == 1:
                if frequency + 1 not in freq and frequency - 1 not in freq:
                    res.append(frequency)
        return res