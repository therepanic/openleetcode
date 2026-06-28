from collections import Counter, defaultdict


class Solution(object):
    def isPossible(self, nums):
        count = Counter(nums)
        subseq = defaultdict(int)

        for num in nums:
            if count[num] == 0:
                continue
            if subseq[num - 1] > 0:
                subseq[num - 1] -= 1
                subseq[num] += 1
            elif count[num + 1] > 0 and count[num + 2] > 0:
                count[num + 1] -= 1
                count[num + 2] -= 1
                subseq[num + 2] += 1
            else:
                return False
            count[num] -= 1

        return True
