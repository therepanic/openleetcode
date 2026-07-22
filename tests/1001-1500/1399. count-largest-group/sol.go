func countLargestGroup(n int) int {
    mpp := make(map[int]int)
    maxi := 0
    count := 0

    for i := 1; i <= n; i++ {
        x := digsum(i)
        mpp[x]++
        if mpp[x] > maxi {
            maxi = mpp[x]
        }
    }

    for _, v := range mpp {
        if v == maxi {
            count++
        }
    }
    return count
}

func digsum(n int) int {
    s := 0
    for n > 0 {
        s += n % 10
        n /= 10
    }
    return s
}
