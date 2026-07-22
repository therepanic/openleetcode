class Solution {
    fun watchedVideosByFriends(watchedVideos: Array<Array<String>>, friends: Array<IntArray>, id: Int, level: Int): List<String> {
        val n = friends.size
        val visited = BooleanArray(n)
        val q: java.util.Queue<Pair<Int, Int>> = java.util.LinkedList()
        q.offer(Pair(id, 0))
        visited[id] = true
        
        val targetPeople = mutableListOf<Int>()
        
        while (q.isNotEmpty()) {
            val (person, dist) = q.poll()
            
            if (dist == level) {
                targetPeople.add(person)
                continue
            }
            
            for (f in friends[person]) {
                if (!visited[f]) {
                    visited[f] = true
                    q.offer(Pair(f, dist + 1))
                }
            }
        }
        
        val freq = mutableMapOf<String, Int>()
        for (p in targetPeople) {
            for (vid in watchedVideos[p]) {
                freq[vid] = freq.getOrDefault(vid, 0) + 1
            }
        }
        
        return freq.keys.sortedWith(compareBy<String> { freq[it] }.thenBy { it })
    }
}
