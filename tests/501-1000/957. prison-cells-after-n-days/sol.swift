class Solution {
    func prisonAfterNDays(_ cells: [Int], _ n: Int) -> [Int] {
        var cells = cells
        var days = (n - 1) % 14 + 1
        for _ in 0..<days {
            var prev = cells[0]
            for i in 1..<(cells.count - 1) {
                let current = cells[i]
                if prev == cells[i + 1] {
                    cells[i] = 1
                } else {
                    cells[i] = 0
                }
                prev = current
            }
            cells[0] = 0
            cells[cells.count - 1] = 0
        }
        return cells
    }
}
