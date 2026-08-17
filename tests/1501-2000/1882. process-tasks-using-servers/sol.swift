class Solution {
    func assignTasks(_ servers: [Int], _ tasks: [Int]) -> [Int] {
        var available: [(Int, Int)] = []
        var busy: [(Int, Int, Int)] = []
        func beforeA(_ a: (Int, Int), _ b: (Int, Int)) -> Bool { a.0 != b.0 ? a.0 < b.0 : a.1 < b.1 }
        func beforeB(_ a: (Int, Int, Int), _ b: (Int, Int, Int)) -> Bool { a.0 < b.0 }
        func pushA(_ x: (Int, Int)) {
            available.append(x); var i = available.count - 1
            while i > 0 { let p = (i - 1) / 2; if !beforeA(available[i], available[p]) { break }; available.swapAt(i, p); i = p }
        }
        func pushB(_ x: (Int, Int, Int)) {
            busy.append(x); var i = busy.count - 1
            while i > 0 { let p = (i - 1) / 2; if !beforeB(busy[i], busy[p]) { break }; busy.swapAt(i, p); i = p }
        }
        func popA() -> (Int, Int) {
            let x = available[0]; let last = available.removeLast()
            if !available.isEmpty { available[0] = last; var i = 0; while true { let l = i * 2 + 1; let r = l + 1; var c = i; if l < available.count && beforeA(available[l], available[c]) { c = l }; if r < available.count && beforeA(available[r], available[c]) { c = r }; if c == i { break }; available.swapAt(i, c); i = c } }
            return x
        }
        func popB() -> (Int, Int, Int) {
            let x = busy[0]; let last = busy.removeLast()
            if !busy.isEmpty { busy[0] = last; var i = 0; while true { let l = i * 2 + 1; let r = l + 1; var c = i; if l < busy.count && beforeB(busy[l], busy[c]) { c = l }; if r < busy.count && beforeB(busy[r], busy[c]) { c = r }; if c == i { break }; busy.swapAt(i, c); i = c } }
            return x
        }
        for i in 0..<servers.count { pushA((servers[i], i)) }
        var ans: [Int] = []; var time = 0
        for i in 0..<tasks.count {
            time = max(time, i)
            while !busy.isEmpty && busy[0].0 <= time { let x = popB(); pushA((x.1, x.2)) }
            if available.isEmpty { time = busy[0].0; while !busy.isEmpty && busy[0].0 <= time { let x = popB(); pushA((x.1, x.2)) } }
            let x = popA(); pushB((time + tasks[i], x.0, x.1)); ans.append(x.1)
        }
        return ans
    }
}
