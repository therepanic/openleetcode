class Solution {
    func getHappyString(_ n: Int, _ k: Int) -> String {
        let total = 3 * (1 << (n - 1))
        if k > total {
            return ""
        }
        
        var k = k - 1
        var result = ""
        var last: Character? = nil
        
        for pos in 0..<n {
            let branch = 1 << (n - pos - 1)
            var choices: [Character] = []
            for c in "abc" {
                if c != last {
                    choices.append(c)
                }
            }
            
            let idx = k / branch
            result.append(choices[idx])
            
            last = choices[idx]
            k %= branch
        }
        
        return result
    }
}
