class Solution {
    fun rotateString(s: String, goal: String): Boolean {
        return s.length == goal.length && (s + s).contains(goal)
    }
}
