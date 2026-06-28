class Solution {
    func slidingPuzzle(_ board: [[Int]]) -> Int {
        let target = "123450"
        let start = board.flatMap { $0 }.map { String($0) }.joined()
        
        let neighbors: [Int: [Int]] = [
            0: [1, 3], 1: [0, 2, 4], 2: [1, 5],
            3: [0, 4], 4: [1, 3, 5], 5: [2, 4]
        ]
        
        var queue: [(String, Int)] = [(start, 0)]
        var visited: Set<String> = [start]
        
        while !queue.isEmpty {
            let (state, moves) = queue.removeFirst()
            
            if state == target {
                return moves
            }
            
            let zeroIndex = state.distance(from: state.startIndex, to: state.firstIndex(of: "0")!)
            
            for neighbor in neighbors[zeroIndex]! {
                var newState = Array(state)
                newState.swapAt(zeroIndex, neighbor)
                let newStateStr = String(newState)
                
                if !visited.contains(newStateStr) {
                    visited.insert(newStateStr)
                    queue.append((newStateStr, moves + 1))
                }
            }
        }
        
        return -1
    }
}
