class Solution:
    def threeEqualParts(self, arr):
        n = len(arr)
        ones = sum(arr)
        if ones == 0:
            return [0, n - 1]
        if ones % 3 != 0:
            return [-1, -1]

        k = ones // 3
        i1 = i2 = i3 = -1
        seen = 0
        for i, x in enumerate(arr):
            if x == 1:
                seen += 1
                if seen == 1:
                    i1 = i
                elif seen == k + 1:
                    i2 = i
                elif seen == 2 * k + 1:
                    i3 = i
                    break

        length = n - i3
        if i1 + length > i2 or i2 + length > i3:
            return [-1, -1]
        for i in range(length):
            if arr[i1 + i] != arr[i2 + i] or arr[i1 + i] != arr[i3 + i]:
                return [-1, -1]
        return [i1 + length - 1, i2 + length]
