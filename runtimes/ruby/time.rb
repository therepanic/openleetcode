require "set"
require "date"
require "time"

${SOLUTION}

${UTILITIES}

start = (Time.now.to_f * 1000).to_i
${CALL_SOLUTION}
finish = (Time.now.to_f * 1000).to_i
puts finish - start
