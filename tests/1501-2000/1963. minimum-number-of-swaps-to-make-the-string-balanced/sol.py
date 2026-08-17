class Solution:
    def minSwaps(self, s: str) -> int:
        swap = 0
        for char in s:
            if char == "[":
                swap += 1
            else:
                if swap > 0:
                    swap -= 1
        return (swap + 1) // 2
