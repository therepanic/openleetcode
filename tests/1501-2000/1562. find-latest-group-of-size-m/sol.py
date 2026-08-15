class Solution(object):
    def findLatestStep(self, arr, m):
        """
        :type arr: List[int]
        :type m: int
        :rtype: int
        """
        n = len(arr)
        if m == n:
            return m

        groups = [0] * (n + 2)
        latest_step = -1

        for i in range(n):
            index = arr[i]
            left = groups[index - 1]
            right = groups[index + 1]

            if left == m or right == m:
                latest_step = i

            groups[index - left] = groups[index + right] = left + right + 1

        return latest_step
