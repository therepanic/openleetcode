class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var res: [Int] = []
        for a in asteroids {
            var destroyed = false
            while !res.isEmpty && a < 0 && res.last! > 0 {
                if -a > res.last! {
                    res.removeLast()
                    continue
                } else if -a == res.last! {
                    res.removeLast()
                }
                destroyed = true
                break
            }
            if !destroyed {
                res.append(a)
            }
        }
        return res
    }
}
