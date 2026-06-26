class Solution(object):
    def arrayNesting(self, nums):
        max_count = 0

        # Iterate through every potential starting index in the array
        for i in range(len(nums)):
            # If the element is marked -1, its cycle has already been visited
            if nums[i] == -1:
                continue

            current_count = 0
            start = i

            # Follow the cyclic path until we hit an already visited node
            while nums[start] != -1:
                next_node = nums[start]
                # Mark the current node as visited by setting it to -1
                nums[start] = -1
                # Move to the next index in the chain
                start = next_node
                current_count += 1

            # Maintain the longest cycle length encountered so far
            if current_count > max_count:
                max_count = current_count

        return max_count
