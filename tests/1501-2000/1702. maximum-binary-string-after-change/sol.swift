class Solution {
    func maximumBinaryString(_ binary: String) -> String {
        let n = binary.count
        let z = binary.filter { $0 == "0" }.count
        
        if z < 2 {
            return binary
        }
        
        let firstZero = binary.firstIndex(of: "0")!
        let firstZeroPos = binary.distance(from: binary.startIndex, to: firstZero)
        let p = firstZeroPos + z - 1
        
        return String(repeating: "1", count: p) + "0" + String(repeating: "1", count: n - p - 1)
    }
}
