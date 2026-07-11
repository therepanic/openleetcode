class Solution {
    func catMouseGame(_ graph: [[Int]]) -> Int {
        let MOUSE = 0
        let CAT = 1
        let MOUSE_WIN = 1
        let CAT_WIN = 2
        let DRAW = 0
        
        let n = graph.count
        var results: [String: Int] = [:]
        for i in 1..<n {
            results["0,\(i),\(CAT)"] = MOUSE_WIN
            results["0,\(i),\(MOUSE)"] = MOUSE_WIN
            results["\(i),\(i),\(CAT)"] = CAT_WIN
            results["\(i),\(i),\(MOUSE)"] = CAT_WIN
        }
        
        var degree: [String: Int] = [:]
        for mouse in 1..<n {
            for cat in 1..<n {
                degree["\(mouse),\(cat),\(MOUSE)"] = graph[mouse].count
                degree["\(mouse),\(cat),\(CAT)"] = graph[cat].filter { $0 != 0 }.count
            }
        }
        
        var q: [String] = Array(results.keys)
        var front = 0
        
        while front < q.count {
            let state = q[front]
            front += 1
            let parts = state.split(separator: ",")
            let mouse = Int(parts[0])!
            let cat = Int(parts[1])!
            let turn = Int(parts[2])!
            let curResult = results[state]!
            
            var prevStates: [String] = []
            if turn == MOUSE {
                for prevCat in graph[cat] {
                    prevStates.append("\(mouse),\(prevCat),\(CAT)")
                }
            } else {
                for prevMouse in graph[mouse] {
                    prevStates.append("\(prevMouse),\(cat),\(MOUSE)")
                }
            }
            
            for prevState in prevStates {
                if results[prevState] != nil { continue }
                let prevParts = prevState.split(separator: ",")
                let prevMouse = Int(prevParts[0])!
                let prevCat = Int(prevParts[1])!
                let prevTurn = Int(prevParts[2])!
                if prevCat == 0 { continue }
                
                degree[prevState]! -= 1
                let isMoverWinner = ((curResult == MOUSE_WIN && prevTurn == MOUSE) ||
                                     (curResult == CAT_WIN && prevTurn == CAT))
                if isMoverWinner || degree[prevState] == 0 {
                    results[prevState] = curResult
                    q.append(prevState)
                }
            }
        }
        
        return results["1,2,\(MOUSE)"] ?? DRAW
    }
}
