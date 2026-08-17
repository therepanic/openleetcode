func countTriples(n int) int {
    cnt := 0
    nsqrt := int(math.Sqrt(float64(n)))
    for s := 2; s <= nsqrt; s++ {
        start := (s & 1) + 1
        for t := start; t < s; t += 2 {
            if gcd(s, t) != 1 {
                continue
            }
            c := s*s + t*t
            if c > n {
                break
            }
            k := n / c
            cnt += 2 * k
        }
    }
    return cnt
}

func gcd(a, b int) int {
    for b != 0 {
        a, b = b, a % b
    }
    return a
}
