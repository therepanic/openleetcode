class Solution {
    func canMakePaliQueries(_ s: String, _ queries: [[Int]]) -> [Bool] {
        let n = s.count
        var prefix = [Int](repeating: 0, count: n + 1)
        let chars = Array(s)
        
        for i in 0..<n {
            let bit = 1 << (Int(chars[i].asciiValue!) - Int(Character("a").asciiValue!))
            prefix[i + 1] = prefix[i] ^ bit
        }
        
        var res = [Bool]()
        
        for query in queries {
            let left = query[0]
            let right = query[1]
            let ki = query[2]
            
            let mask = prefix[right + 1] ^ prefix[left]
            let oddCount = mask.nonzeroBitCount
            
            if oddCount <= 1 || ki >= oddCount / 2 {
                res.append(true)
            } else {
                res.append(false)
            }
        }
        
        return res
    }
}
