class Solution(object):
    def longestSubsequence(self, arr, difference):
        """
        :type arr: List[int]
        :type difference: int
        :rtype: int
        """
        dic = {}
        for x in arr:
            if (x - difference) not in dic:
                dic[x] = 1
            else:
                dic[x] = dic[x - difference] + 1
        return max(dic.values())
