import java.util.*

class DualHeap(k: Int) {
    val small = PriorityQueue<Int>(compareByDescending { it })
    val large = PriorityQueue<Int>()
    val delayed = HashMap<Int, Int>()
    var k = k
    var smallSize = 0
    var largeSize = 0

    fun prune(heap: PriorityQueue<Int>) {
        while (!heap.isEmpty()) {
            val num = heap.peek()
            if (delayed[num] ?: 0 == 0) break
            delayed[num] = delayed[num]!! - 1
            if (delayed[num] == 0) delayed.remove(num)
            heap.poll()
        }
    }

    fun makeBalance() {
        if (smallSize > largeSize + 1) {
            large.offer(small.poll())
            smallSize--
            largeSize++
            prune(small)
        } else if (smallSize < largeSize) {
            small.offer(large.poll())
            smallSize++
            largeSize--
            prune(large)
        }
    }

    fun insert(num: Int) {
        if (small.isEmpty() || num <= small.peek()) {
            small.offer(num)
            smallSize++
        } else {
            large.offer(num)
            largeSize++
        }
        makeBalance()
    }

    fun erase(num: Int) {
        delayed[num] = (delayed[num] ?: 0) + 1
        if (num <= small.peek()) {
            smallSize--
            if (num == small.peek()) prune(small)
        } else {
            largeSize--
            if (!large.isEmpty() && num == large.peek()) prune(large)
        }
        makeBalance()
    }

    fun median(): Double {
        return if (k % 2 == 1) small.peek().toDouble()
        else (small.peek().toDouble() + large.peek().toDouble()) / 2.0
    }
}

class Solution {
    fun medianSlidingWindow(nums: IntArray, k: Int): DoubleArray {
        val dh = DualHeap(k)
        for (i in 0 until k) dh.insert(nums[i])
        val ans = DoubleArray(nums.size - k + 1)
        ans[0] = dh.median()
        for (i in k until nums.size) {
            dh.insert(nums[i])
            dh.erase(nums[i - k])
            ans[i - k + 1] = dh.median()
        }
        return ans
    }
}
