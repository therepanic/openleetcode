from typing import List

class Solution:
    def maxSubsequence(self, nums: List[int], k: int) -> List[int]:
        # Pair with indices
        nums_with_indices = [(num, i) for i, num in enumerate(nums)]
        
        # Sort by value descending
        nums_with_indices.sort(key=lambda x: -x[0])
        
        # Take top k and sort by original index
        top_k = sorted(nums_with_indices[:k], key=lambda x: x[1])
        
        # Extract values
        return [num for num, _ in top_k]