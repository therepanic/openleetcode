func partition(s string) [][]string {
    result := make([][]string, 0)
    path := make([]string, 0)
    var isPalindrome func(int, int) bool
    isPalindrome = func(left, right int) bool {
        for left < right { if s[left] != s[right] { return false }; left++; right-- }
        return true
    }
    var backtrack func(int)
    backtrack = func(index int) {
        if index == len(s) { combo := append([]string(nil), path...); result = append(result, combo); return }
        for end := index; end < len(s); end++ {
            if isPalindrome(index, end) {
                path = append(path, s[index:end+1])
                backtrack(end + 1)
                path = path[:len(path)-1]
            }
        }
    }
    backtrack(0)
    return result
}
