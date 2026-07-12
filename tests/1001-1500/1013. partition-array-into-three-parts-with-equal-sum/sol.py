class Solution:
    def canThreePartsEqualSum(self, arr: List[int]) -> bool:
        total = sum(arr)
        if total % 3 != 0:
            return False
        target = total // 3
        current_sum = 0
        partitions = 0
        for i in range(len(arr)):
            current_sum += arr[i]
            if current_sum == target:
                partitions += 1
                current_sum = 0
                # If we found two partitions and it's not the end, the rest must be the third
                if partitions == 2 and i < len(arr) - 1:
                    return True
        return False
