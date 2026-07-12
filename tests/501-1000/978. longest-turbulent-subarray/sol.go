func maxTurbulenceSize(arr []int) int {
    N := len(arr)
    if N < 2 {
        return N
    }

    ans := 1
    anchor := 0

    compare := func(x, y int) int {
        if x < y {
            return -1
        }
        if x > y {
            return 1
        }
        return 0
    }

    for i := 1; i < N; i++ {
        c := compare(arr[i-1], arr[i])
        if c == 0 {
            anchor = i
        } else {
            if i == N-1 || c*compare(arr[i], arr[i+1]) != -1 {
                if i-anchor+1 > ans {
                    ans = i - anchor + 1
                }
                anchor = i
            }
        }
    }
    return ans
}
