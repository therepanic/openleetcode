class Solution(object):
    def minimumRefill(self, plants, capacityA, capacityB):
        """
        :type plants: List[int]
        :type capacityA: int
        :type capacityB: int
        :rtype: int
        """
        n = len(plants)
        left, right = 0, n - 1
        waterA, waterB = capacityA, capacityB
        refills = 0

        while left < right:
            if waterA < plants[left]:
                refills += 1
                waterA = capacityA
            waterA -= plants[left]

            if waterB < plants[right]:
                refills += 1
                waterB = capacityB
            waterB -= plants[right]

            left += 1
            right -= 1

        if left == right:
            if max(waterA, waterB) < plants[left]:
                refills += 1

        return refills