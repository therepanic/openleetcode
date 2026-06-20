class Solution(object):
    def findNthDigit(self, n):
        i = 1
        count = 9
        start = 1

        while n > i * count:
            n -= i * count
            i += 1
            count *= 10
            start *= 10

        number = start + (n - 1) // i
        return int(str(number)[(n - 1) % i])
