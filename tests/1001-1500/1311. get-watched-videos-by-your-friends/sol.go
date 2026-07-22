func watchedVideosByFriends(watchedVideos [][]string, friends [][]int, id int, level int) []string {
    n := len(friends)
    visited := make([]bool, n)
    q := [][]int{{id, 0}}
    visited[id] = true
    
    targetPeople := []int{}
    
    for len(q) > 0 {
        person := q[0][0]
        dist := q[0][1]
        q = q[1:]
        
        if dist == level {
            targetPeople = append(targetPeople, person)
            continue
        }
        
        for _, f := range friends[person] {
            if !visited[f] {
                visited[f] = true
                q = append(q, []int{f, dist + 1})
            }
        }
    }
    
    freq := make(map[string]int)
    for _, p := range targetPeople {
        for _, vid := range watchedVideos[p] {
            freq[vid]++
        }
    }
    
    result := make([]string, 0, len(freq))
    for k := range freq {
        result = append(result, k)
    }
    
    sort.Slice(result, func(i, j int) bool {
        if freq[result[i]] != freq[result[j]] {
            return freq[result[i]] < freq[result[j]]
        }
        return result[i] < result[j]
    })
    
    return result
}
