class Solution {
    func kSimilarity(_ s1: String, _ s2: String) -> Int {
        var queue = [s1]
        var seen = Set<String>()
        var answ = 0
        let s1Arr = Array(s1)
        let s2Arr = Array(s2)
        
        while !queue.isEmpty {
            let size = queue.count
            for _ in 0..<size {
                let string = queue.removeFirst()
                if string == s2 { return answ }
                
                let arr = Array(string)
                var i = 0
                while arr[i] == s2Arr[i] { i += 1 }
                
                for j in i+1..<arr.count {
                    if arr[i] == s2Arr[j] && s2Arr[j] != s1Arr[j] {
                        var newArr = arr
                        newArr.swapAt(i, j)
                        let newStr = String(newArr)
                        if !seen.contains(newStr) {
                            seen.insert(newStr)
                            queue.append(newStr)
                        }
                    }
                }
            }
            answ += 1
        }
        return answ
    }
}
