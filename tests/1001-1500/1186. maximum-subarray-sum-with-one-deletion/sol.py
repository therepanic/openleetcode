class Solution:
    def maximumSum(self, arr: list[int]) -> int:
        n = len(arr)
        if n == 1:
            return arr[0]

        # max_no_delete: Max sum ending at i without any deletions (Kadane's).
        max_no_delete = arr[0]

        # max_one_delete: Max sum ending at i with exactly one deletion.
        max_one_delete = arr[0]
        result = arr[0]

        for i in range(1, n):
            prev_no_delete = max_no_delete

            # Standard Kadane: extend previous or start new.
            max_no_delete = max(max_no_delete + arr[i], arr[i])

            # One-deletion logic:
            # 1. Use existing deletion and keep current element.
            # 2. Skip current element (use prev_no_delete).
            max_one_delete = max(max_one_delete + arr[i], prev_no_delete)

            result = max(result, max_no_delete, max_one_delete)

        return result
