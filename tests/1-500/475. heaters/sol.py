class Solution(object):
    def findRadius(self, houses, heaters):
        houses.sort()
        heaters.sort()
        radius = 0
        for house in houses:
            left, right = 0, len(heaters) - 1
            while left < right:
                mid = (left + right) // 2
                if heaters[mid] < house:
                    left = mid + 1
                else:
                    right = mid
            dist = abs(heaters[left] - house)
            if left > 0:
                dist = min(dist, abs(heaters[left - 1] - house))
            radius = max(radius, dist)
        return radius
