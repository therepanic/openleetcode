import Foundation

${SOLUTION}

${JSON_GEN}

let start = Int(Date().timeIntervalSince1970 * 1000)
${CALL_SOLUTION}
let end = Int(Date().timeIntervalSince1970 * 1000)
print(end - start)
