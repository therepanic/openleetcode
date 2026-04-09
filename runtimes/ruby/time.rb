require "set"
require "date"
require "time"

${SOLUTION}

${JSON_GEN}

start = (Time.now.to_f * 1000).to_i
${CALL_SOLUTION}
finish = (Time.now.to_f * 1000).to_i
puts finish - start
