class Solution:
    def maxSum(self, nums1: List[int], nums2: List[int]) -> int:
        ## RC ##
        ## APPROACH : GREEDY ##
        ## LOGIC ##
        ## 1. similar to merging 2 sorted arrays
        ## 2. Maintain sum for each array
        ## 3. when you find the same element in both arrays, only take maximum of sum1, sum2 and reset them

        p1, p2, sum1, sum2, result = 0, 0, 0, 0, 0
        while p1 < len(nums1) and p2 < len(nums2):
            if nums1[p1] == nums2[p2]:
                result += max(sum1, sum2) + nums1[p1]
                sum1, sum2 = 0, 0
                p1, p2 = p1 + 1, p2 + 1
            elif nums1[p1] < nums2[p2]:
                sum1 += nums1[p1]
                p1 += 1
            else:
                sum2 += nums2[p2]
                p2 += 1

        while p1 < len(nums1):
            sum1 += nums1[p1]
            p1 += 1

        while p2 < len(nums2):
            sum2 += nums2[p2]
            p2 += 1

        return (result + max(sum1, sum2)) % (10**9 + 7)
