class Solution {
    func countGoodTriplets(_ arr: [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
        let n = arr.count
        var count = 0
        for i in 0..<n {
            for j in (i+1)..<n {
                for k in (j+1)..<n {
                    if abs(arr[i] - arr[j]) <= a && abs(arr[j] - arr[k]) <= b && abs(arr[i] - arr[k]) <= c {
                        count += 1
                    }
                }
            }
        }
        return count
    }
}
