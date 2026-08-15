func longestBeautifulSubstring(word string) int {
    n := len(word)
    i := 0
    length := 0

    for i < n {
        if word[i] != 'a' {
            i++
            continue
        }

        j := i
        unique := 1
        for j+1 < n && word[j+1] >= word[j] {
            if word[j+1] != word[j] {
                unique++
            }
            j++
        }

        if unique == 5 {
            if j-i+1 > length {
                length = j - i + 1
            }
        }

        i = j + 1
    }

    return length
}
