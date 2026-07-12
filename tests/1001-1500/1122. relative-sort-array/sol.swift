class Solution {
    func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
        var freq = [Int](repeating: 0, count: 1001)
        var arr1 = arr1
        for num in arr1 {
            freq[num] += 1
        }
        var idx = 0
        for num in arr2 {
            while freq[num] > 0 {
                arr1[idx] = num
                idx += 1
                freq[num] -= 1
            }
        }
        for num in 0..<1001 {
            while freq[num] > 0 {
                arr1[idx] = num
                idx += 1
                freq[num] -= 1
            }
        }
        return arr1
    }
}
