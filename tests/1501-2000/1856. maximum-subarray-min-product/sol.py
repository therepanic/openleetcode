class Solution:
    def maxSumMinProduct(self, nums: List[int]) -> int:
        n = len(nums)
        # 1. Transform the signal into Prefix Sums (Integral Domain)
        # This allows O(1) energy calculation for any window
        prefix_sums = [0] * (n + 1)
        for i in range(n):
            prefix_sums[i + 1] = prefix_sums[i] + nums[i]

        # 2. Monotonic Transform: Find the 'Spectral Window' for each element
        # We find the nearest smaller element to the left and right
        left_bound = [-1] * n
        right_bound = [n] * n
        stack = []

        # Finding 'Right Boundaries' (where the minimum would drop)
        for i in range(n):
            while stack and nums[stack[-1]] > nums[i]:
                right_bound[stack.pop()] = i
            stack.append(i)

        stack = []
        # Finding 'Left Boundaries'
        for i in range(n - 1, -1, -1):
            while stack and nums[stack[-1]] > nums[i]:
                left_bound[stack.pop()] = i
            stack.append(i)

        # 3. Calculate Resonance: Multiply each 'Signal Peak' by its window area
        max_prod = 0
        for i in range(n):
            l, r = left_bound[i], right_bound[i]
            # Window sum = Area from (l+1) to (r-1)
            total_sum = prefix_sums[r] - prefix_sums[l + 1]
            max_prod = max(max_prod, nums[i] * total_sum)

        return max_prod % (10**9 + 7)
