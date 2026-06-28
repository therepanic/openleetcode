class Solution:
    def canPlaceFlowers(self, fb: List[int], n: int) -> bool:
        if n == 0:
            return True
        length = len(fb)

        for i in range(length):
            if fb[i] == 0:
                left = (i == 0) or (fb[i - 1] == 0)
                right = (i == length - 1) or (fb[i + 1] == 0)

                if left and right:
                    fb[i] = 1
                    n -= 1

                    if n == 0:
                        return True
        return False
