class Solution {
    func filterRestaurants(_ restaurants: [[Int]], _ veganFriendly: Int, _ maxPrice: Int, _ maxDistance: Int) -> [Int] {
        var restaurantsFiltered: [[Int]] = []

        for restaurant in restaurants {
            if veganFriendly == 1 && restaurant[2] != 1 {
                continue
            }
            
            if restaurant[3] > maxPrice {
                continue
            }

            if restaurant[4] > maxDistance {
                continue
            }

            restaurantsFiltered.append([restaurant[1], restaurant[0]])
        }

        restaurantsFiltered.sort { a, b in
            if a[0] != b[0] {
                return a[0] > b[0]
            }
            return a[1] > b[1]
        }

        var result: [Int] = []

        for restaurant in restaurantsFiltered {
            result.append(restaurant[1])
        }

        return result
    }
}
