func dieSimulator(n int, rollMax []int) int {
    const MOD = 1_000_000_007
    faces := 6

    f := make([][]int, n)
    for i := range f {
        f[i] = make([]int, faces)
    }
    s := make([]int, n)

    for j := 0; j < faces; j++ {
        f[0][j] = 1
    }
    s[0] = faces

    for i := 1; i < n; i++ {
        for j := 0; j < faces; j++ {
            maxRepeat := rollMax[j]
            res := s[i-1]

            if i > maxRepeat {
                res -= (s[i-maxRepeat-1] - f[i-maxRepeat-1][j])
            } else if i == maxRepeat {
                res -= 1
            }

            f[i][j] = ((res % MOD) + MOD) % MOD
        }

        sum := 0
        for j := 0; j < faces; j++ {
            sum = (sum + f[i][j]) % MOD
        }
        s[i] = sum
    }

    return s[n-1]
}
