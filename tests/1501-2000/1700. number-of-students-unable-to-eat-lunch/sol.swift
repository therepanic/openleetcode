class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var s = students
        var sw = sandwiches
        var c = 0
        while !s.isEmpty {
            if s[0] == sw[0] {
                sw.removeFirst()
                s.removeFirst()
                c = 0
            } else {
                s.append(s.removeFirst())
                c += 1
            }
            if c == s.count { break }
        }
        return s.count
    }
}
