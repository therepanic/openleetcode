func alphabetBoardPath(target string) string {
    arr := [][]int{{0,1,2,3,4},{5,6,7,8,9},{10,11,12,13,14},{15,16,17,18,19},{20,21,22,23,24},{25}}
    word := make([]int, len(target))
    for i, c := range target {
        word[i] = int(c - 'a')
    }
    s := ""
    j, k := 0, 0
    if word[0] % 5 != 0 {
        for d := 0; d < word[0]/5; d++ {
            s += "D"
        }
    } else {
        for d := 0; d < word[0]/5; d++ {
            s += "D"
        }
    }
    if word[0] % 5 >= 0 {
        for r := 0; r < word[0]%5; r++ {
            s += "R"
        }
    }
    s += "!"
    for i := 1; i < len(word); i++ {
        for h := 0; h < len(arr); h++ {
            for l := 0; l < len(arr[h]); l++ {
                if arr[h][l] == word[i-1] {
                    j = h
                }
                if arr[h][l] == word[i] {
                    k = h
                }
            }
        }
        if word[i-1] == 25 {
            if j > k {
                for u := 0; u < j - k; u++ {
                    s += "U"
                }
            } else {
                for d := 0; d < k - j; d++ {
                    s += "D"
                }
            }
            if word[i] % 5 >= word[i-1] % 5 {
                for r := 0; r < word[i]%5 - word[i-1]%5; r++ {
                    s += "R"
                }
            } else {
                for l := 0; l < word[i-1]%5 - word[i]%5; l++ {
                    s += "L"
                }
            }
        } else {
            if word[i] % 5 >= word[i-1] % 5 {
                for r := 0; r < word[i]%5 - word[i-1]%5; r++ {
                    s += "R"
                }
            } else {
                for l := 0; l < word[i-1]%5 - word[i]%5; l++ {
                    s += "L"
                }
            }
            if j > k {
                for u := 0; u < j - k; u++ {
                    s += "U"
                }
            } else {
                for d := 0; d < k - j; d++ {
                    s += "D"
                }
            }
        }
        s += "!"
    }
    return s
}
