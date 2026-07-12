class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        let n = rooms.count
        var keys = [0]
        var visited = Array(repeating: false, count: n)
        visited[0] = true
        var count = 1
        while !keys.isEmpty {
            let room = keys.removeLast()
            for i in rooms[room] {
                if !visited[i] {
                    visited[i] = true
                    keys.append(i)
                    count += 1
                }
            }
        }
        return count == n
    }
}
