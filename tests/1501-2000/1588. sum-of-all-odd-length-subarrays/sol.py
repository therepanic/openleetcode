class Solution(object):
    def sumOddLengthSubarrays(self, arr):
        s = sum(arr)
        l = len(arr) - 1
        i = 2
        while l >= i:
            j = 0
            e = i
            while e <= l:
                s += sum(arr[j : e + 1])
                j += 1
                e += 1
            i += 2
        return s
