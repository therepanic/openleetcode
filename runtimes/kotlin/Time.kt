import java.lang.reflect.*
import java.time.temporal.TemporalAccessor
import java.util.*
import java.lang.reflect.Array

${SOLUTION}

${UTILITIES}

fun main() {
    val cur = System.currentTimeMillis()
    ${CALL_SOLUTION}
    val now = System.currentTimeMillis()
    println(now - cur)
}