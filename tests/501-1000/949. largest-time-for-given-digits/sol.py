from itertools import permutations


class Solution(object):
    def largestTimeFromDigits(self, arr):
        # Generate all 24 possible permutations of the 4 digits
        perm_list = list(permutations(arr))
        best_time = -1
        best_idx = -1

        # Evaluate every permutation configuration
        for i, perm in enumerate(perm_list):
            hours = perm[0] * 10 + perm[1]
            minutes = perm[2] * 10 + perm[3]

            # Check if the permutation forms a valid 24-hour timestamp boundary
            if hours < 24 and minutes < 60:
                curr_time = hours * 60 + minutes
                # Track the largest time configuration found
                if curr_time > best_time:
                    best_time = curr_time
                    best_idx = i

        # If no configuration was valid, return an empty string
        if best_idx == -1:
            return ""

        # Reconstruct the string from the best index arrangement
        res = perm_list[best_idx]
        return str(res[0]) + str(res[1]) + ":" + str(res[2]) + str(res[3])
