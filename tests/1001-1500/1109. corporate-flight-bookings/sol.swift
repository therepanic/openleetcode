class Solution {
    func corpFlightBookings(_ bookings: [[Int]], _ n: Int) -> [Int] {
        var l = Array(repeating: 0, count: n + 1)
        for i in bookings {
            let x = i[0]
            let y = i[1]
            l[x - 1] += i[2]
            l[y] -= i[2]
        }
        
        var s = [Int]()
        for i in 0..<n {
            if i == 0 {
                s.append(l[i])
            } else {
                s.append(s[i - 1] + l[i])
            }
        }
        return s
    }
}
