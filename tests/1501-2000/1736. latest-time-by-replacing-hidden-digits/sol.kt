class Solution {
    fun maximumTime(time: String): String {
        var ret = StringBuilder()
        for (i in 0 until time.length) {
            val c = time[i]
            if (c == '?') {
                if (i == 0) {
                    if (time[i+1] == '?') {
                        ret.append('2')
                    } else if (time[i+1] in '0'..'3') {
                        ret.append('2')
                    } else {
                        ret.append('1')
                    }
                } else if (i == 1) {
                    if (time[i-1] == '?') {
                        ret.append('3')
                    } else if (time[i-1] == '0' || time[i-1] == '1') {
                        ret.append('9')
                    } else {
                        ret.append('3')
                    }
                } else if (i == 3) {
                    ret.append('5')
                } else if (i == 4) {
                    ret.append('9')
                }
            } else {
                ret.append(c)
            }
        }
        return ret.toString()
    }
}
