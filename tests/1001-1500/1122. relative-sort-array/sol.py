class Solution:
    def relativeSortArray(self, arr1, arr2):
        freq = [0] * 1001

        for num in arr1:
            freq[num] += 1

        idx = 0

        for num in arr2:
            while freq[num] > 0:
                arr1[idx] = num
                idx += 1
                freq[num] -= 1

        for num in range(1001):
            while freq[num] > 0:
                arr1[idx] = num
                idx += 1
                freq[num] -= 1

        return arr1
