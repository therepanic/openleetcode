func countTriplets(nums []int) int {
    most := 0
    for _, num := range nums {
        if num > most {
            most = num
        }
    }
    if most == 0 {
        return len(nums) * len(nums) * len(nums)
    }

    bits := 0
    for tmp := most; tmp > 0; tmp >>= 1 {
        bits++
    }
    N := 1 << bits

    c := make([]int, N)
    for _, num := range nums {
        c[num]++
    }

    for h := 1; h < N; h <<= 1 {
        for s := 0; s < N; s += h << 1 {
            for i := s; i < s+h; i++ {
                c[i] += c[i+h]
            }
        }
    }

    for i := 0; i < N; i++ {
        c[i] = c[i] * c[i] * c[i]
    }

    for h := 1; h < N; h <<= 1 {
        for s := 0; s < N; s += h << 1 {
            for i := s; i < s+h; i++ {
                c[i] -= c[i+h]
            }
        }
    }

    return c[0]
}
