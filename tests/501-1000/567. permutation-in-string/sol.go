func checkInclusion(s1 string, s2 string) bool {
    n1, n2 := len(s1), len(s2)
    if n2 < n1 {
        return false
    }

    c1 := [26]int{}
    c2 := [26]int{}

    for i := 0; i < n1; i++ {
        c1[s1[i]-'a']++
        c2[s2[i]-'a']++
    }

    if c1 == c2 {
        return true
    }

    for i := n1; i < n2; i++ {
        c2[s2[i]-'a']++
        c2[s2[i-n1]-'a']--

        if c1 == c2 {
            return true
        }
    }

    return false
}
