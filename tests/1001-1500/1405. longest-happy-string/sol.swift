class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var heap = [(Int, Character)]()
        if a > 0 { heap.append((a, "a")) }
        if b > 0 { heap.append((b, "b")) }
        if c > 0 { heap.append((c, "c")) }
        heap.sort { $0.0 > $1.0 }
        
        var res = [Character]()
        
        while !heap.isEmpty {
            var (count, ch) = heap.removeFirst()
            if res.count >= 2 && res[res.count - 2] == ch && res[res.count - 1] == ch {
                if heap.isEmpty {
                    break
                }
                var (count2, ch2) = heap.removeFirst()
                res.append(ch2)
                count2 -= 1
                if count2 > 0 {
                    heap.append((count2, ch2))
                    heap.sort { $0.0 > $1.0 }
                }
            } else {
                res.append(ch)
                count -= 1
            }
            
            if count > 0 {
                heap.append((count, ch))
                heap.sort { $0.0 > $1.0 }
            }
        }
        
        return String(res)
    }
}
