class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = Array(repeating: [Int](), count: numCourses)
        var indegree = Array(repeating: 0, count: numCourses)
        for edge in prerequisites {
            graph[edge[1]].append(edge[0])
            indegree[edge[0]] += 1
        }
        var queue: [Int] = []
        for i in 0..<numCourses where indegree[i] == 0 { queue.append(i) }
        var seen = 0
        var head = 0
        while head < queue.count {
            let node = queue[head]
            head += 1
            seen += 1
            for nxt in graph[node] {
                indegree[nxt] -= 1
                if indegree[nxt] == 0 { queue.append(nxt) }
            }
        }
        return seen == numCourses
    }
}
