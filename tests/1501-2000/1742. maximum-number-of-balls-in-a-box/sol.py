class Solution:
    def countBalls(self, lowLimit: int, highLimit: int) -> int:
        from collections import defaultdict

        box_count = defaultdict(int)
        max_balls = 0

        for num in range(lowLimit, highLimit + 1):
            box = sum(int(digit) for digit in str(num))
            box_count[box] += 1
            max_balls = max(max_balls, box_count[box])

        return max_balls
