class Solution {
    func sumGame(_ num: String) -> Bool {
        let chars = Array(num)
        let n = chars.count
        let half = n / 2
        var sumLeft = 0, sumRight = 0
        var qLeft = 0, qRight = 0

        for i in 0..<half {
            if chars[i] == "?" {
                qLeft += 1
            } else {
                sumLeft += Int(String(chars[i]))!
            }
        }

        for i in half..<n {
            if chars[i] == "?" {
                qRight += 1
            } else {
                sumRight += Int(String(chars[i]))!
            }
        }

        return (sumLeft - sumRight) * 2 != (qRight - qLeft) * 9
    }
}
