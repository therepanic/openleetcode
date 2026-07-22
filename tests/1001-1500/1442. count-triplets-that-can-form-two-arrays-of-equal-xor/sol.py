class Solution:
    def countTriplets(self, arr):
        total_count = 0
        prefix_xor = 0
        prefix_count = {0: 1}
        index_sum = {0: 0}

        for k, value in enumerate(arr, 1):
            prefix_xor ^= value
            if prefix_xor in prefix_count:
                total_count += (
                    prefix_count[prefix_xor] * (k - 1) - index_sum[prefix_xor]
                )
            else:
                prefix_count[prefix_xor] = 0
                index_sum[prefix_xor] = 0
            prefix_count[prefix_xor] += 1
            index_sum[prefix_xor] += k

        return total_count
