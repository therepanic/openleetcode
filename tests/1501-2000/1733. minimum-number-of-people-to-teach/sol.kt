class Solution {
    fun minimumTeachings(n: Int, languages: Array<IntArray>, friendships: Array<IntArray>): Int {
        val usersToTeach = mutableSetOf<Int>()
        
        for (friendship in friendships) {
            val user1 = friendship[0] - 1
            val user2 = friendship[1] - 1
            var canCommunicate = false
            for (lang1 in languages[user1]) {
                for (lang2 in languages[user2]) {
                    if (lang1 == lang2) {
                        canCommunicate = true
                        break
                    }
                }
                if (canCommunicate) break
            }
            if (!canCommunicate) {
                usersToTeach.add(user1)
                usersToTeach.add(user2)
            }
        }
        
        var minUsers = languages.size + 1
        for (language in 1..n) {
            var count = 0
            for (user in usersToTeach) {
                var hasLang = false
                for (lang in languages[user]) {
                    if (lang == language) {
                        hasLang = true
                        break
                    }
                }
                if (!hasLang) count++
            }
            minUsers = minOf(minUsers, count)
        }
        return minUsers
    }
}
