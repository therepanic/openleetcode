class Solution {
    func getOrder(_ tasks: [[Int]]) -> [Int] {
        let n = tasks.count
        var indexed = [(Int, Int, Int)]()
        for i in 0..<n {
            indexed.append((tasks[i][0], tasks[i][1], i))
        }
        indexed.sort(by: { $0.0 < $1.0 })
        
        var result = [Int]()
        var heap = [(Int, Int)]()
        var time = 0
        var idx = 0
        
        while idx < n || !heap.isEmpty {
            if heap.isEmpty && time < indexed[idx].0 {
                time = indexed[idx].0
            }
            
            while idx < n && indexed[idx].0 <= time {
                heap.append((indexed[idx].1, indexed[idx].2))
                heap.sort { 
                    if $0.0 != $1.0 { return $0.0 < $1.0 }
                    return $0.1 < $1.1
                }
                idx += 1
            }
            
            let (process, index) = heap.removeFirst()
            result.append(index)
            time += process
        }
        
        return result
    }
}
