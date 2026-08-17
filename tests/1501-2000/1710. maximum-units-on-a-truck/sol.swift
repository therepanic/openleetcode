class Solution {
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        let sorted = boxTypes.sorted { $0[1] > $1[1] }
        var remaining = truckSize
        var ans = 0
        for box in sorted {
            let quantitytaken = min(remaining, box[0])
            ans += box[1] * quantitytaken
            remaining -= quantitytaken
            if remaining == 0 { break }
        }
        return ans
    }
}
