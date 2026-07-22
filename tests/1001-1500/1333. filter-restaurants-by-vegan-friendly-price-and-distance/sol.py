class Solution:
    def filterRestaurants(
        self,
        restaurants: List[List[int]],
        veganFriendly: int,
        maxPrice: int,
        maxDistance: int,
    ) -> List[int]:

        restaurants_filtered = []

        for restaurant in restaurants:
            if veganFriendly == 1 and restaurant[2] != 1:
                continue

            if restaurant[3] > maxPrice:
                continue

            if restaurant[4] > maxDistance:
                continue

            restaurants_filtered.append([restaurant[1], restaurant[0]])  # [rating, id]

        restaurants_filtered.sort()
        restaurants_filtered.reverse()

        result = []

        for restaurant in restaurants_filtered:
            result.append(restaurant[1])

        return result
