class Solution {
    func getMaxRepetitions(_ s1: String, _ n1: Int, _ s2: String, _ n2: Int) -> Int {
        let m = s1.count
        let n = s2.count
        
        if m * n1 < n * n2 {
            return 0
        }
        
        var j = 0
        var cnt = 0
        var k = 0
        
        var seen = [Int: (Int, Int)]()
        let s1Array = Array(s1)
        let s2Array = Array(s2)
        
        while k < n1 {
            for ch in s1Array {
                if ch == s2Array[j] {
                    j += 1
                    if j == n {
                        cnt += 1
                        j = 0
                    }
                }
            }
            
            k += 1
            
            if let (prevCnt, prevK) = seen[j] {
                let periodK = k - prevK
                let periodCnt = cnt - prevCnt
                
                if periodCnt == 0 {
                    break
                }
                
                let remaining = n1 - k
                let cycles = remaining / periodK
                
                cnt += cycles * periodCnt
                k += cycles * periodK
            } else {
                seen[j] = (cnt, k)
            }
        }
        
        return cnt / n2
    }
}
