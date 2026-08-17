class Solution:
    def minNumberOperations(self, target: List[int]) -> int:
        sum = target[0]  # start with first element
        for i in range(1, len(target)):
            if target[i] > target[i - 1]:
                sum += target[i] - target[i - 1]  # add only when value rises
        return sum  # total operations
