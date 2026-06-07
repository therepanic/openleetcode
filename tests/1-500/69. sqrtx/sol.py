class Solution(object):
    def mySqrt(self, x):
        if x < 2:
            return x
        
        count = 0
        temp = x
        while temp > 0:
            count += 1
            temp >>= 1
        
        result = 0
        for i in range((count + 1) // 2, -1, -1):
            result |= (1 << i)
            if result * result > x:
                result ^= (1 << i)
        
        return result