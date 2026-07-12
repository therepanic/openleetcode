func distributeCandies(candies int, num_people int) []int {
    res := make([]int, num_people)
    give := 1
    i := 0

    for candies > 0 {
        if give < candies {
            res[i % num_people] += give
        } else {
            res[i % num_people] += candies
        }
        candies -= give
        give++
        i++
    }

    return res
}
