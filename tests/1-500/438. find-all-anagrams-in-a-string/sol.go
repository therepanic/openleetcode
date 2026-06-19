func findAnagrams(s string, p string) []int {
    n1, n2 := len(s), len(p)
    res := []int{}
    if n1 < n2 {
        return res
    }

    a := [26]int{}
    b := [26]int{}

    for i := 0; i < n2; i++ {
        a[p[i]-'a']++
        b[s[i]-'a']++
    }

    if a == b {
        res = append(res, 0)
    }

    for i := n2; i < n1; i++ {
        b[s[i]-'a']++
        b[s[i-n2]-'a']--
        if a == b {
            res = append(res, i-n2+1)
        }
    }

    return res
}
