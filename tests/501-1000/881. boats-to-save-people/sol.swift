class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        var people = people.sorted()
        var start = 0
        var end = people.count - 1
        var boats = 0
        
        while start <= end {
            if people[start] + people[end] <= limit {
                start += 1
                end -= 1
            } else {
                end -= 1
            }
            boats += 1
        }
        
        return boats
    }
}
