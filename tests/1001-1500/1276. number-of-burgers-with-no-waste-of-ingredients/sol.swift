class Solution {
    func numOfBurgers(_ tomatoSlices: Int, _ cheeseSlices: Int) -> [Int] {
        if (tomatoSlices - 2 * cheeseSlices) % 2 != 0 {
            return []
        }

        let x = (tomatoSlices - 2 * cheeseSlices) / 2
        let y = cheeseSlices - x

        if x < 0 || y < 0 {
            return []
        }

        return [x, y]
    }
}
