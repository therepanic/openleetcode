class Solution {
    func minimumTeachings(_ n: Int, _ languages: [[Int]], _ friendships: [[Int]]) -> Int {
        var usersToTeach = Set<Int>()
        
        for friendship in friendships {
            let user1 = friendship[0] - 1
            let user2 = friendship[1] - 1
            var canCommunicate = false
            for lang1 in languages[user1] {
                if languages[user2].contains(lang1) {
                    canCommunicate = true
                    break
                }
            }
            if !canCommunicate {
                usersToTeach.insert(user1)
                usersToTeach.insert(user2)
            }
        }
        
        var minUsers = languages.count + 1
        for language in 1...n {
            var count = 0
            for user in usersToTeach {
                if !languages[user].contains(language) {
                    count += 1
                }
            }
            minUsers = min(minUsers, count)
        }
        return minUsers
    }
}
