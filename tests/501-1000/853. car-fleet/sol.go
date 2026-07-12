func carFleet(target int, position []int, speed []int) int {
    n := len(position)
    cars := make([][2]int, n)
    for i := 0; i < n; i++ {
        cars[i] = [2]int{position[i], speed[i]}
    }
    sort.Slice(cars, func(i, j int) bool {
        return cars[i][0] > cars[j][0]
    })
    stack := []float64{}
    for _, car := range cars {
        t := float64(target-car[0]) / float64(car[1])
        if len(stack) == 0 || t > stack[len(stack)-1] {
            stack = append(stack, t)
        }
    }
    return len(stack)
}
