class Solution:
    def minSwap(self, nums1: List[int], nums2: List[int]) -> int:
        n = len(nums1)

        keep = 0
        swap = 1

        for i in range(1, n):
            inc = nums1[i] > nums1[i - 1] and nums2[i] > nums2[i - 1]
            cross = nums1[i] > nums2[i - 1] and nums2[i] > nums1[i - 1]

            if inc and cross:
                keep, swap = min(keep, swap), min(keep, swap) + 1
            elif inc:
                swap += 1
            else:
                keep, swap = swap, keep + 1

        return min(keep, swap)
