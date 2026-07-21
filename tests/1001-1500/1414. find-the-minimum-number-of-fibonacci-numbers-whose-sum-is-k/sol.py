class Solution(object):
    def findMinFibonacciNumbers(self, k):
        """
        :type k: int
        :rtype: int
        """
        fib = [1, 1]
        while fib[-1] <= k:
            fib.append(fib[-1] + fib[-2])

        count = 0
        i = len(fib) - 1

        while k > 0:
            if fib[i] <= k:
                k -= fib[i]
                count += 1
            i -= 1

        return count
