func largestComponentSize(nums []int) int {
    n := len(nums)
    root := make([]int, n)
    rank := make([]int, n)
    for i := 0; i < n; i++ {
        root[i] = i
        rank[i] = 1
    }

    var find func(int) int
    find = func(x int) int {
        for root[x] != x {
            root[x] = root[root[x]]
            x = root[x]
        }
        return x
    }

    union := func(x, y int) {
        rx, ry := find(x), find(y)
        if rx == ry {
            return
        }
        if rank[rx] > rank[ry] {
            root[ry] = rx
        } else if rank[rx] < rank[ry] {
            root[rx] = ry
        } else {
            root[ry] = rx
            rank[rx]++
        }
    }

    getPrimeFactors := func(num int) []int {
        res := []int{}
        n := num
        if n%2 == 0 {
            res = append(res, 2)
            for n%2 == 0 {
                n /= 2
            }
        }
        for i := 3; i*i <= n; i += 2 {
            if n%i == 0 {
                res = append(res, i)
                for n%i == 0 {
                    n /= i
                }
            }
        }
        if n > 2 {
            res = append(res, n)
        }
        return res
    }

    primeToIdx := make(map[int]int)
    for i, num := range nums {
        primes := getPrimeFactors(num)
        for _, p := range primes {
            if idx, ok := primeToIdx[p]; ok {
                union(idx, i)
            }
            primeToIdx[p] = i
        }
    }

    count := make(map[int]int)
    maxSize := 0
    for i := 0; i < n; i++ {
        r := find(i)
        count[r]++
        if count[r] > maxSize {
            maxSize = count[r]
        }
    }
    return maxSize
}
