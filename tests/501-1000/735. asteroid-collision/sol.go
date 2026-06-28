func asteroidCollision(asteroids []int) []int {
    res := []int{}
    for _, a := range asteroids {
        destroyed := false
        for len(res) > 0 && a < 0 && res[len(res)-1] > 0 {
            if -a > res[len(res)-1] {
                res = res[:len(res)-1]
                continue
            } else if -a == res[len(res)-1] {
                res = res[:len(res)-1]
            }
            destroyed = true
            break
        }
        if !destroyed {
            res = append(res, a)
        }
    }
    return res
}
