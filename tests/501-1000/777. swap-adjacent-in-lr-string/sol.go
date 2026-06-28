func canTransform(start string, result string) bool {
    n := len(start)
    i, j := 0, 0

    for i < n || j < n {
        for i < n && start[i] == 'X' {
            i++
        }
        for j < n && result[j] == 'X' {
            j++
        }

        if (i == n) != (j == n) {
            return false
        }

        if i < n && j < n {
            if start[i] != result[j] {
                return false
            }
            if start[i] == 'L' && j > i {
                return false
            }
            if start[i] == 'R' && j < i {
                return false
            }
        }

        i++
        j++
    }

    return true
}
