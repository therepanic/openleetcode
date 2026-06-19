class Solution {
    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        var result: [String] = []
        for hour in 0..<12 {
            for minute in 0..<60 {
                let hourBits = String(hour, radix: 2).filter { $0 == "1" }.count
                let minuteBits = String(minute, radix: 2).filter { $0 == "1" }.count
                if hourBits + minuteBits == turnedOn {
                    result.append(String(format: "%d:%02d", hour, minute))
                }
            }
        }
        return result
    }
}
