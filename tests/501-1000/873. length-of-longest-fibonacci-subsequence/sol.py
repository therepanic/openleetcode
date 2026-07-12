class Solution:
    def lenLongestFibSubseq(self, arr: list[int]) -> int:
        n = len(arr)
        # dp[prev][curr] stores length of Fibonacci sequence ending at indexes prev,curr
        dp = [[0] * n for _ in range(n)]
        max_len = 0

        # Find all possible pairs that sum to arr[curr]
        for curr in range(2, n):
            # Use two pointers to find pairs that sum to arr[curr]
            start = 0
            end = curr - 1

            while start < end:
                pair_sum = arr[start] + arr[end]

                if pair_sum > arr[curr]:
                    end -= 1
                elif pair_sum < arr[curr]:
                    start += 1
                else:
                    # Found a valid pair, update dp
                    dp[end][curr] = dp[start][end] + 1
                    max_len = max(dp[end][curr], max_len)
                    end -= 1
                    start += 1

        # Add 2 to include first two numbers, or return 0 if no sequence found
        return max_len + 2 if max_len else 0
