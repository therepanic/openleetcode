func accountsMerge(accounts [][]string) [][]string {
    n := len(accounts)
    location := make(map[string]map[int]bool)
    content := make([]map[string]bool, n)
    
    for i := 0; i < n; i++ {
        name := accounts[i][0]
        if location[name] == nil {
            location[name] = make(map[int]bool)
        }
        location[name][i] = true
        content[i] = make(map[string]bool)
        for _, email := range accounts[i][1:] {
            content[i][email] = true
        }
    }
    
    for _, indices := range location {
        for i := range indices {
            if !indices[i] {
                continue
            }
            for j := range indices {
                if i != j && indices[j] && hasIntersection(content[i], content[j]) {
                    for email := range content[i] {
                        content[j][email] = true
                    }
                    delete(indices, i)
                    break
                }
            }
        }
    }
    
    result := [][]string{}
    for name, indices := range location {
        for idx := range indices {
            emails := []string{}
            for email := range content[idx] {
                emails = append(emails, email)
            }
            sort.Strings(emails)
            entry := []string{name}
            entry = append(entry, emails...)
            result = append(result, entry)
        }
    }
    return result
}

func hasIntersection(a, b map[string]bool) bool {
    for k := range a {
        if b[k] {
            return true
        }
    }
    return false
}
