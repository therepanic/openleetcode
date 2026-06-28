class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var res = letters[0]
        var flag = false

        for ch in letters {
            if !flag {
                if ch > target {
                    res = ch
                    flag = !flag
                }
            } else {
                if ch > target && ch < res {
                    res = ch
                }
            }
        }

        return res
    }
}
