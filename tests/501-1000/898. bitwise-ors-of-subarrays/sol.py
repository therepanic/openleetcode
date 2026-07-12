class Solution:
    def subarrayBitwiseORs(self, arr: list[int]) -> int:
        # This set will store all unique OR values found across all subarrays.
        result_ors = set()

        # This set stores the distinct ORs of all subarrays ending at the previous position.
        current_ors = set()

        # Iterate through each element of the array.
        for x in arr:
            # `next_ors` will store the ORs of subarrays ending at the current element `x`.
            # It's calculated by OR-ing x with all values in `current_ors`,
            # and adding x itself (for the subarray of length 1).
            next_ors = {x | y for y in current_ors}
            next_ors.add(x)

            # Add all newly found ORs for subarrays ending at x to the main result set.
            result_ors.update(next_ors)

            # For the next iteration, the current results become the previous results.
            current_ors = next_ors

        return len(result_ors)
