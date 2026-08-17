# Python version (for reference)
class Solution:
    def containsPattern(self, arr, m, k):
        for i in range(len(arr) - m * k + 1):
            match = True
            for j in range(m * (k - 1)):
                if arr[i + j] != arr[i + j + m]:
                    match = False
                    break
            if match:
                return True
        return False
