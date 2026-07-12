class Solution:
    def shipWithinDays(self, weights: List[int], days: int) -> int:
        low = max(weights)
        high = sum(weights)

        while low <= high:
            mid = (low + high) // 2

            required_days = 1
            load = 0

            for weight in weights:
                if load + weight > mid:
                    required_days += 1
                    load = weight
                else:
                    load += weight

            if required_days <= days:
                high = mid - 1
            else:
                low = mid + 1

        return low
