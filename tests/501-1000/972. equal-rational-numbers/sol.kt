class Solution {
    fun isRationalEqual(s: String, t: String): Boolean {
        fun gcd(a: Long, b: Long): Long {
            var x = kotlin.math.abs(a)
            var y = kotlin.math.abs(b)
            while (y != 0L) {
                val tmp = x % y
                x = y
                y = tmp
            }
            return x
        }

        fun pow10(n: Int): Long {
            var r = 1L
            repeat(n) { r *= 10L }
            return r
        }

        fun norm(num: Long, den: Long): Pair<Long, Long> {
            var n = num
            var d = den
            val g = gcd(n, d)
            n /= g
            d /= g
            if (d < 0) {
                n = -n
                d = -d
            }
            return Pair(n, d)
        }

        fun add(a: Pair<Long, Long>, b: Pair<Long, Long>): Pair<Long, Long> {
            return norm(a.first * b.second + b.first * a.second, a.second * b.second)
        }

        fun parse(x: String): Pair<Long, Long> {
            if (!x.contains('.')) {
                return norm(x.toLong(), 1L)
            }
            val parts = x.split(".", limit = 2)
            val integer = parts[0]
            val frac = parts[1]
            if (!frac.contains('(')) {
                if (frac.isEmpty()) {
                    return norm(integer.toLong(), 1L)
                }
                return add(norm(integer.toLong(), 1L), norm(frac.toLong(), pow10(frac.length)))
            }
            val repParts = frac.split("(", limit = 2)
            val nonrep = repParts[0]
            val rep = repParts[1].dropLast(1)
            var base = norm(integer.toLong(), 1L)
            if (nonrep.isNotEmpty()) {
                base = add(base, norm(nonrep.toLong(), pow10(nonrep.length)))
            }
            val repeatNum = rep.toLong()
            val repeatDen = (pow10(rep.length) - 1L) * pow10(nonrep.length)
            return add(base, norm(repeatNum, repeatDen))
        }

        return parse(s) == parse(t)
    }
}
