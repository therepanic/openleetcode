import collections


class Solution(object):
    def findLength(self, nums1, nums2):
        P, MOD = 113, 10**9 + 7
        Pinv = pow(P, MOD - 2, MOD)

        def check(guess):
            def rolling(nums, length):
                if length == 0:
                    yield 0, 0
                    return

                h, power = 0, 1
                for i, x in enumerate(nums):
                    h = (h + x * power) % MOD
                    if i < length - 1:
                        power = (power * P) % MOD
                    else:
                        yield h, i - (length - 1)
                        h = (h - nums[i - (length - 1)]) * Pinv % MOD

            hashes = collections.defaultdict(list)
            for ha, start in rolling(nums1, guess):
                hashes[ha].append(start)
            for ha, start in rolling(nums2, guess):
                iarr = hashes.get(ha, [])
                if any(
                    nums1[i : i + guess] == nums2[start : start + guess] for i in iarr
                ):
                    return True
            return False

        lo, hi = 0, min(len(nums1), len(nums2)) + 1
        while lo < hi:
            mi = (lo + hi) // 2
            if check(mi):
                lo = mi + 1
            else:
                hi = mi
        return lo - 1
