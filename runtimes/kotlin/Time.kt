import java.lang.reflect.*
import java.time.temporal.TemporalAccessor
import java.util.*
import java.lang.reflect.Array

import kotlin.math.*
import java.lang.StringBuilder

${SOLUTION}

${UTILITIES}

fun main() {
    val cur = System.currentTimeMillis()
    ${CALL_SOLUTION}
    val now = System.currentTimeMillis()
    println(now - cur)
}