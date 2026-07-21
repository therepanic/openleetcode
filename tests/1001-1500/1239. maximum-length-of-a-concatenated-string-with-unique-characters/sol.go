func maxLength(arr []string) int {
    ans := 0

    isUnique := func(s string) bool {
        mask := 0
        for _, c := range s {
            bit := 1 << (c - 'a')
            if mask&bit != 0 {
                return false
            }
            mask |= bit
        }
        return true
    }

    hasCommon := func(a, b string) bool {
        for _, c := range b {
            for _, d := range a {
                if c == d {
                    return true
                }
            }
        }
        return false
    }

    var dfs func(int, string)
    dfs = func(i int, path string) {
        if len(path) > ans {
            ans = len(path)
        }
        for j := i; j < len(arr); j++ {
            s := arr[j]
            if !isUnique(s) || hasCommon(path, s) {
                continue
            }
            dfs(j+1, path+s)
        }
    }

    dfs(0, "")
    return ans
}
