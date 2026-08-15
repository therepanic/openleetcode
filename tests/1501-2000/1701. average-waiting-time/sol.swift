class Solution {
    func averageWaitingTime(_ customers: [[Int]]) -> Double {
        var waiting = 0
        var current = 0
        for customer in customers {
            let arrival = customer[0]
            let time = customer[1]
            if current <= arrival {
                current = arrival + time
                waiting += time
            } else {
                current += time
                waiting += (current - arrival)
            }
        }
        return Double(waiting) / Double(customers.count)
    }
}
