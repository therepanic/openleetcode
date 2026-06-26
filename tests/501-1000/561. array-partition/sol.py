class Solution(object):
    def arrayPairSum(self, nums):
        bucket = [0] * 20001
        for x in nums:
            bucket[x + 10000] += 1
        res = 0
        flag = True
        for i in range(20001):
            while bucket[i]:
                if flag:
                    res += i - 10000
                flag = not flag
                bucket[i] -= 1
        return res
