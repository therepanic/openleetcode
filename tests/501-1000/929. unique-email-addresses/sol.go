func numUniqueEmails(emails []string) int {
    res := make(map[string]bool)
    for _, email := range emails {
        atIndex := 0
        for i, ch := range email {
            if ch == '@' {
                atIndex = i
                break
            }
        }
        local := email[:atIndex]
        domain := email[atIndex+1:]
        
        plusIndex := -1
        for i, ch := range local {
            if ch == '+' {
                plusIndex = i
                break
            }
        }
        if plusIndex != -1 {
            local = local[:plusIndex]
        }
        
        filteredLocal := ""
        for _, ch := range local {
            if ch != '.' {
                filteredLocal += string(ch)
            }
        }
        res[filteredLocal + "@" + domain] = true
    }
    return len(res)
}
