class Solution {
    func decode(_ encoded: [Int]) -> [Int] {
        let n = encoded.count + 1
        var xr = 0
        for i in 1...n { xr ^= i }
        var nxr = 0
        for (i, v) in encoded.enumerated() {
            if i % 2 == 1 { nxr ^= v }
        }
        var perm = [Int](repeating: 0, count: n)
        perm[0] = xr ^ nxr
        for i in 0..<encoded.count {
            perm[i + 1] = encoded[i] ^ perm[i]
        }
        return perm
    }
}
