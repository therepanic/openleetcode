func minimumTeachings(n int, languages [][]int, friendships [][]int) int {
    usersToTeach := make(map[int]bool)
    
    for _, friendship := range friendships {
        user1 := friendship[0] - 1
        user2 := friendship[1] - 1
        canCommunicate := false
        for _, lang1 := range languages[user1] {
            for _, lang2 := range languages[user2] {
                if lang1 == lang2 {
                    canCommunicate = true
                    break
                }
            }
            if canCommunicate {
                break
            }
        }
        if !canCommunicate {
            usersToTeach[user1] = true
            usersToTeach[user2] = true
        }
    }
    
    minUsers := len(languages) + 1
    for language := 1; language <= n; language++ {
        count := 0
        for user := range usersToTeach {
            hasLang := false
            for _, lang := range languages[user] {
                if lang == language {
                    hasLang = true
                    break
                }
            }
            if !hasLang {
                count++
            }
        }
        if count < minUsers {
            minUsers = count
        }
    }
    return minUsers
}
