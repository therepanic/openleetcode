func numTilings(n int) int {
    const MOD = 1_000_000_007
    if n == 0 {
        return 1
    }
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 2
    }

    multiply := func(A, B [3][3]int) [3][3]int {
        var C [3][3]int
        for i := 0; i < 3; i++ {
            for j := 0; j < 3; j++ {
                var s int64 = 0
                for k := 0; k < 3; k++ {
                    s = (s + int64(A[i][k]) * int64(B[k][j])) % MOD
                }
                C[i][j] = int(s)
            }
        }
        return C
    }

    power := func(base [3][3]int, exp int) [3][3]int {
        result := [3][3]int{{1,0,0},{0,1,0},{0,0,1}}
        b := base
        e := exp
        for e > 0 {
            if e & 1 == 1 {
                result = multiply(result, b)
            }
            b = multiply(b, b)
            e >>= 1
        }
        return result
    }

    t := [3][3]int{{2,0,1},{1,0,0},{0,1,0}}
    p := power(t, n-2)
    return (p[0][0]*2 + p[0][1] + p[0][2]) % MOD
}
