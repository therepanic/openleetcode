import java.lang.reflect.*
import java.time.temporal.TemporalAccessor
import java.util.*
import java.io.File
import com.google.gson.Gson
import com.google.gson.annotations.SerializedName
import com.google.gson.reflect.TypeToken
import kotlin.math.*
import java.lang.StringBuilder
${IMPORTS}

data class TestInput(@SerializedName("val") var value: Any? = null)

val _TEST_: Map<String, Map<String, TestInput>> =
    Gson().fromJson(
        File("test.json").readText(),
        object : TypeToken<Map<String, Map<String, TestInput>>>() {}.type
    )

fun testVal(caseId: String, name: String): Any? = _TEST_[caseId]!![name]!!.value

${SOLUTION}

${UTILITIES}

fun main() {
    ${INSERTION}
}
