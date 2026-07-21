class Solution {
    func maxNumberOfFamilies(_ n: Int, _ reservedSeats: [[Int]]) -> Int {
        var rowSeats: [Int: Set<Int>] = [:]
        
        for reservation in reservedSeats {
            let row = reservation[0]
            let seat = reservation[1]
            rowSeats[row, default: Set()].insert(seat)
        }
        
        var ans = (n - rowSeats.count) * 2
        
        let option1: Set<Int> = [2, 3, 4, 5]
        let option2: Set<Int> = [6, 7, 8, 9]
        let option3: Set<Int> = [4, 5, 6, 7]
        
        for seats in rowSeats.values {
            var available = 0
            if seats.isDisjoint(with: option1) {
                available += 1
            }
            if seats.isDisjoint(with: option2) {
                available += 1
            }
            if seats.isDisjoint(with: option3) {
                available = max(available, 1)
            }
            ans += available
        }
        
        return ans
    }
}
