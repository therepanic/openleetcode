class Solution:
    def advantageCount(self, nums1: List[int], nums2: List[int]) -> List[int]:
        n = len(nums1)
        nums1.sort()
        nums2 = [(nums2[i], i) for i in range(n)]
        nums2.sort(key=lambda x: x[0])
        res = [0] * n

        left, right = 0, n - 1
        for i in range(n - 1, -1, -1):
            if nums1[right] > nums2[i][0]:
                res[nums2[i][1]] = nums1[right]
                right -= 1
            else:
                res[nums2[i][1]] = nums1[left]
                left += 1

        return res
