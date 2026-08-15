from collections import Counter


class Solution:
    def recoverArray(self, n: int, sums: List[int]) -> List[int]:
        sums.sort()
        res = []

        for _ in range(n):
            # The difference between the smallest two sums is a candidate element
            d = sums[1] - sums[0]

            # Partition the sums into two halves
            left_part = []
            right_part = []
            count = Counter(sums)

            # Greedily pair up sums that differ by exactly 'd'
            for s in sums:
                if count[s] > 0:
                    left_part.append(s)
                    right_part.append(s + d)
                    count[s] -= 1
                    count[s + d] -= 1

            # Check if 0 is in the left partition to determine the sign of d
            # If 0 is in left_part, then 'd' is the original element.
            # If not, '-d' is the original element and we use right_part for the next iteration.
            if 0 in Counter(left_part):
                res.append(d)
                sums = left_part
            else:
                res.append(-d)
                sums = right_part

        return res
