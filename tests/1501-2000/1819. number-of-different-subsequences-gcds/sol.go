func countDifferentSubsequenceGCDs(nums []int) int {
    seen := make(map[int]bool)
    maxi := 0
    for _, num := range nums {
        seen[num] = true
        if num > maxi {
            maxi = num
        }
    }
    cnt := 0
    for i := 1; i <= maxi; i++ {
        gd := 0
        for j := i; j <= maxi; j += i {
            if seen[j] {
                gd = gcd(gd, j)
            }
        }
        if gd == i {
            cnt++
        }
    }
    return cnt
}

func gcd(a, b int) int {
    for b != 0 {
        a, b = b, a%b
    }
    return a
}
