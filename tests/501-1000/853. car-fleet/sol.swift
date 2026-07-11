class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var cars = zip(position, speed).sorted { $0.0 > $1.0 }
        var stack: [Double] = []
        for (p, s) in cars {
            let t = Double(target - p) / Double(s)
            if stack.isEmpty || t > stack.last! {
                stack.append(t)
            }
        }
        return stack.count
    }
}
