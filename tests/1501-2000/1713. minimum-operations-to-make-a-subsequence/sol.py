from bisect import bisect_left


class Solution:
    def minOperations(self, target: list[int], arr: list[int]) -> int:
        target_index_map = {num: i for i, num in enumerate(target)}

        # Create a list of indices from arr that exist in target
        transformed_arr = []
        for num in arr:
            if num in target_index_map:
                transformed_arr.append(target_index_map[num])

        # Find the length of the longest increasing subsequence (LIS)
        lis = []
        for index in transformed_arr:
            pos = bisect_left(lis, index)
            if pos == len(lis):
                lis.append(index)
            else:
                lis[pos] = index

        # The number of operations is the difference
        return len(target) - len(lis)
