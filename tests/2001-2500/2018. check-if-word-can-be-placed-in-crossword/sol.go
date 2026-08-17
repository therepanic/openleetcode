func placeWordInCrossword(board [][]byte, word string) bool {
    canPlace := func(segment string, w string) bool {
        if len(segment) != len(w) {
            return false
        }
        for i := 0; i < len(segment); i++ {
            if segment[i] != ' ' && segment[i] != w[i] {
                return false
            }
        }
        return true
    }
    
    m, n := len(board), len(board[0])
    revWord := reverseString(word)
    
    for _, row := range board {
        parts := splitString(string(row), '#')
        for _, part := range parts {
            if part != "" && (canPlace(part, word) || canPlace(part, revWord)) {
                return true
            }
        }
    }
    
    for j := 0; j < n; j++ {
        col := make([]byte, m)
        for i := 0; i < m; i++ {
            col[i] = board[i][j]
        }
        parts := splitString(string(col), '#')
        for _, part := range parts {
            if part != "" && (canPlace(part, word) || canPlace(part, revWord)) {
                return true
            }
        }
    }
    return false
}

func reverseString(s string) string {
    runes := []rune(s)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}

func splitString(s string, sep byte) []string {
    var parts []string
    var sb strings.Builder
    for i := 0; i < len(s); i++ {
        if s[i] == sep {
            parts = append(parts, sb.String())
            sb.Reset()
        } else {
            sb.WriteByte(s[i])
        }
    }
    parts = append(parts, sb.String())
    return parts
}
