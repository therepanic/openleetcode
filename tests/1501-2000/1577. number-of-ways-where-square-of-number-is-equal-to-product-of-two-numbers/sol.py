from collections import Counter


class Solution(object):
    def numTriplets(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: int
        """

        def count_pairs(numsA, numsB):
            count = 0
            freq = Counter()

            for i in range(len(numsB)):
                for j in range(i + 1, len(numsB)):
                    prod = numsB[i] * numsB[j]
                    freq[prod] += 1

            for num in numsA:
                sq = num * num
                count += freq[sq]
            return count

        return count_pairs(nums1, nums2) + count_pairs(nums2, nums1)
