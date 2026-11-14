class Solution(object):
    def platesBetweenCandles(self, s, queries):
        """
        :type s: str
        :type queries: List[List[int]]
        :rtype: List[int]
        """
        n = len(s)
        
        prefix = [0] * (n + 1)
        for i in range(n):
            prefix[i + 1] = prefix[i] + (1 if s[i] == '*' else 0)

        left = [-1] * n
        prev = -1
        for i in range(n):
            if s[i] == '|':
                prev = i
            left[i] = prev

        right = [-1] * n
        next_candle = -1
        for i in range(n - 1, -1, -1):
            if s[i] == '|':
                next_candle = i
            right[i] = next_candle

        result = []
        for l, r in queries:
            l_candle = right[l]
            r_candle = left[r]
            if l_candle != -1 and r_candle != -1 and l_candle < r_candle:
                result.append(prefix[r_candle + 1] - prefix[l_candle])
            else:
                result.append(0)

        return result