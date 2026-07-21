class Solution:
    def numberOfSubarrays(self, nums, k):
        count = {0: 1}
        odd = 0
        answer = 0
        for value in nums:
            odd += value % 2
            answer += count.get(odd - k, 0)
            count[odd] = count.get(odd, 0) + 1
        return answer
