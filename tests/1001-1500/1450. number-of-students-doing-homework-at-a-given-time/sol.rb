# @param {Integer[]} start_time
# @param {Integer[]} end_time
# @param {Integer} query_time
# @return {Integer}
def busy_student(start_time, end_time, query_time)
    start_time.zip(end_time).count { |s, e| s <= query_time && query_time <= e }
end
