class Solution {
    func watchedVideosByFriends(_ watchedVideos: [[String]], _ friends: [[Int]], _ id: Int, _ level: Int) -> [String] {
        let n = friends.count
        var visited = [Bool](repeating: false, count: n)
        var q = [(Int, Int)]()
        q.append((id, 0))
        visited[id] = true
        
        var targetPeople = [Int]()
        
        while !q.isEmpty {
            let (person, dist) = q.removeFirst()
            
            if dist == level {
                targetPeople.append(person)
                continue
            }
            
            for f in friends[person] {
                if !visited[f] {
                    visited[f] = true
                    q.append((f, dist + 1))
                }
            }
        }
        
        var freq = [String: Int]()
        for p in targetPeople {
            for vid in watchedVideos[p] {
                freq[vid, default: 0] += 1
            }
        }
        
        return freq.keys.sorted { 
            if freq[$0]! != freq[$1]! {
                return freq[$0]! < freq[$1]!
            }
            return $0 < $1
        }
    }
}
