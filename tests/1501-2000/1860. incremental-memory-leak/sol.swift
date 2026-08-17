class Solution {
    func memLeak(_ memory1: Int, _ memory2: Int) -> [Int] {
        var mem1 = memory1
        var mem2 = memory2
        var time = 1
        while true {
            if mem1 >= mem2 {
                if mem1 >= time {
                    mem1 -= time
                } else {
                    break
                }
            } else {
                if mem2 >= time {
                    mem2 -= time
                } else {
                    break
                }
            }
            time += 1
        }
        return [time, mem1, mem2]
    }
}
