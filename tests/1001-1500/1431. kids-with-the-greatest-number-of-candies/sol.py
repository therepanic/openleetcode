class Solution:
    def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
        current_max = max(candies)
        result = []

        for candy_count in candies:
            if candy_count + extraCandies >= current_max:
                result.append(True)
            else:
                result.append(False)

        return result
