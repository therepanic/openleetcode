class Solution {
    fun numOfMinutes(n: Int, headID: Int, manager: IntArray, informTime: IntArray): Int {
        val children = Array(n) { mutableListOf<Int>() }
        for (employee in 0 until n) {
            val parent = manager[employee]
            if (parent != -1) {
                children[parent].add(employee)
            }
        }
        val stack = ArrayDeque<Pair<Int, Int>>()
        stack.addLast(Pair(headID, 0))
        var answer = 0
        while (stack.isNotEmpty()) {
            val (employee, elapsed) = stack.removeLast()
            answer = maxOf(answer, elapsed)
            for (child in children[employee]) {
                stack.addLast(Pair(child, elapsed + informTime[employee]))
            }
        }
        return answer
    }
}
