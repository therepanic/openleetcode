func filterRestaurants(restaurants [][]int, veganFriendly int, maxPrice int, maxDistance int) []int {
    restaurantsFiltered := [][]int{}

    for _, restaurant := range restaurants {
        if veganFriendly == 1 && restaurant[2] != 1 {
            continue
        }
        
        if restaurant[3] > maxPrice {
            continue
        }

        if restaurant[4] > maxDistance {
            continue
        }

        restaurantsFiltered = append(restaurantsFiltered, []int{restaurant[1], restaurant[0]})
    }

    sort.Slice(restaurantsFiltered, func(i, j int) bool {
        if restaurantsFiltered[i][0] != restaurantsFiltered[j][0] {
            return restaurantsFiltered[i][0] > restaurantsFiltered[j][0]
        }
        return restaurantsFiltered[i][1] > restaurantsFiltered[j][1]
    })

    result := []int{}

    for _, restaurant := range restaurantsFiltered {
        result = append(result, restaurant[1])
    }

    return result
}
