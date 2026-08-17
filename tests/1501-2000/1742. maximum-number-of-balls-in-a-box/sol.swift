class Solution {
    func countBalls(_ lowLimit: Int, _ highLimit: Int) -> Int {
        var boxCount = [Int: Int]()
        var maxBalls = 0
        for num in lowLimit...highLimit {
            let box = String(num).reduce(0) { $0 + Int(String($1))! }
            boxCount[box, default: 0] += 1
            maxBalls = max(maxBalls, boxCount[box]!)
        }
        return maxBalls
    }
}
