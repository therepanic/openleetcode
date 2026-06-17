func palindromePairs(words []string) [][]int {
    ans := [][]int{}
    wordMap := map[string]int{}
    for i, word := range words {
        wordMap[reverse(word)] = i
    }

    if idx, ok := wordMap[""]; ok {
        for i, word := range words {
            if word != "" && isPalindrome(word) {
                ans = append(ans, []int{i, idx})
            }
        }
    }

    for i, word := range words {
        for j := 0; j < len(word); j++ {
            left := word[:j+1]
            right := word[j+1:]
            if idx, ok := wordMap[left]; ok && isPalindrome(right) && idx != i {
                ans = append(ans, []int{i, idx})
            }
            if idx, ok := wordMap[right]; ok && isPalindrome(left) && idx != i {
                ans = append(ans, []int{idx, i})
            }
        }
    }
    return ans
}

func isPalindrome(s string) bool {
    for i := 0; i < len(s)/2; i++ {
        if s[i] != s[len(s)-1-i] {
            return false
        }
    }
    return true
}

func reverse(s string) string {
    r := []rune(s)
    for i, j := 0, len(r)-1; i < j; i, j = i+1, j-1 {
        r[i], r[j] = r[j], r[i]
    }
    return string(r)
}
