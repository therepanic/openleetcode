# T.C: O(max_val * log(max_val))
# S.C: O(max_val)
class Solution:
    def sumOfFlooredPairs(self, nums: list[int]) -> int:
        MOD = 10**9 + 7
        maxi = 10**5 + 1

        freq = [0] * (2 * maxi + 1)
        max_val = max(nums)

        # freq and maximum number
        for num in nums:
            freq[num] += 1

        # prefix sum
        for i in range(1, 2 * maxi + 1):
            freq[i] += freq[i - 1]

        total = 0
        for num in range(1, max_val + 1):
            if freq[num] == freq[num - 1]:
                continue  # skip numbers not in nums

            count_num = freq[num] - freq[num - 1]
            floor_value = 1

            while floor_value * num <= max_val:
                left = floor_value * num
                right = min((floor_value + 1) * num - 1, max_val)

                count_in_range = freq[right] - freq[left - 1]
                total = (total + (count_num * floor_value * count_in_range) % MOD) % MOD

                floor_value += 1

        return total
