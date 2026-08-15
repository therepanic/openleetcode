class Solution:
    def mostCompetitive(self, nums: List[int], k: int) -> List[int]:
        # lexographically smallest subsequence of size k
        stack = []
        n = len(nums)
        for i in range(n):
            while len(stack) and stack[-1] > nums[i]:
                # pop only if future suffices
                if (n - 1 - i) >= k - len(stack):
                    stack.pop()
                else:
                    break
            stack.append(nums[i])
        # print(stack[:k])
        return stack[:k]
