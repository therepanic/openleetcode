class Solution {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        var s = arr.reduce(0, +)
        let l = arr.count - 1
        var i = 2
        while l >= i {
            var j = 0
            var e = i
            while e <= l {
                for k in j...e {
                    s += arr[k]
                }
                j += 1
                e += 1
            }
            i += 2
        }
        return s
    }
}
