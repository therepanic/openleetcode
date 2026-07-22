func checkIfCanBreak(s1 string, s2 string) bool {
    freq := make([]int, 26)
    n := len(s1)

    for _, ch := range s1 {
        freq[ch - 'a']++
    }

    temp1 := make([]byte, 0, n)

    for i := 25; i >= 0; i-- {
        for freq[i] > 0 {
            temp1 = append(temp1, byte('a' + i))
            freq[i]--
        }
    }

    freq = make([]int, 26)

    for _, ch := range s2 {
        freq[ch - 'a']++
    }

    temp2 := make([]byte, 0, n)

    for i := 25; i >= 0; i-- {
        for freq[i] > 0 {
            temp2 = append(temp2, byte('a' + i))
            freq[i]--
        }
    }

    sorted1 := string(temp1)
    sorted2 := string(temp2)

    all1 := true
    all2 := true

    for i := 0; i < n; i++ {
        if sorted1[i] < sorted2[i] {
            all1 = false
        }
        if sorted2[i] < sorted1[i] {
            all2 = false
        }
    }

    return all1 || all2
}
