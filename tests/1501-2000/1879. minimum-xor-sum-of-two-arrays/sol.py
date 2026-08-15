class Solution:
    def minimumXORSum(self, nums1: List[int], nums2: List[int]) -> int:
        fullMask = 1 << len(nums1)
        dp = [2147483647 for mask in range(fullMask)]
        dp[0] = 0
        for mask in range(fullMask):
            index = bin(mask).count("1")
            if index >= len(nums1):
                continue
            for jndex in range(len(nums1)):
                if (mask & (1 << jndex)) == 0:
                    nextMask = mask | (1 << jndex)
                    cost = dp[mask] + (nums1[index] ^ nums2[jndex])
                    if cost < dp[nextMask]:
                        dp[nextMask] = cost
        return dp[fullMask - 1]
