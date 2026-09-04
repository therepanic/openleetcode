class Solution:
    def minMoves(self, target: int, maxDoubles: int) -> int:
        steps = 0
        
        while target > 1 and maxDoubles > 0:
            if target % 2 == 0:
                target //= 2
                maxDoubles -= 1
            else:
                target -= 1
            steps += 1
            
        # Add remaining steps if target > 1
        if target > 1:
            steps += (target - 1)
            
        return steps