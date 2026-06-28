class Solution {
    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        var callstack: [[Int]] = []
        var exectime = Array(repeating: 0, count: n)
        
        for log in logs {
            let parts = log.split(separator: ":")
            let idn = Int(parts[0])!
            let status = String(parts[1])
            let curtime = Int(parts[2])!
            
            if status == "start" {
                callstack.append([idn, curtime])
            } else {
                let top = callstack.removeLast()
                let x = top[0]
                let y = top[1]
                let time = curtime - y + 1
                exectime[x] += time
                if !callstack.isEmpty {
                    let prev = callstack.last![0]
                    exectime[prev] -= time
                }
            }
        }
        
        return exectime
    }
}
