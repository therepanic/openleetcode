class Solution:
    def binaryGap(self, n: int) -> int:
        max_dist = 0
        curr_dist = 0
        found_first_one = False

        while n > 0:
            bit = n % 2

            if bit == 1:
                if found_first_one:
                    max_dist = max(max_dist, curr_dist)

                curr_dist = 1
                found_first_one = True
            else:
                if found_first_one:
                    curr_dist += 1

            n //= 2

        return max_dist
