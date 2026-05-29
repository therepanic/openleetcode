require "set"
require "date"
require "time"
require "json"

$TEST_ = JSON.parse(File.read("test.json"))

def _test_val(case_id, name)
  $TEST_[case_id][name]["val"]
end

${SOLUTION}

${UTILITIES}

${INSERTION}
