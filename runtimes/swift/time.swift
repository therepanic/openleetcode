import Foundation

${SOLUTION}

${UTILITIES}

let start = Int(Date().timeIntervalSince1970 * 1000)
let result = ${CALL_SOLUTION}
let end = Int(Date().timeIntervalSince1970 * 1000)
print(end - start)
