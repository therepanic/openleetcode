class Solution {
    func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
        if m * k > bloomDay.count { return -1 }
        
        func f(_ timeLimit: Int) -> Bool {
            var cntr = 0
            var bouquetCntr = 0
            for day in bloomDay {
                if day <= timeLimit {
                    cntr += 1
                    if cntr == k {
                        bouquetCntr += 1
                        cntr = 0
                    }
                } else {
                    cntr = 0
                }
            }
            return bouquetCntr >= m
        }
        
        var s = bloomDay.min()!
        var e = bloomDay.max()!
        var ans = -1
        
        while s <= e {
            let mid = s + (e - s) / 2
            if f(mid) {
                ans = mid
                e = mid - 1
            } else {
                s = mid + 1
            }
        }
        
        return ans
    }
}
