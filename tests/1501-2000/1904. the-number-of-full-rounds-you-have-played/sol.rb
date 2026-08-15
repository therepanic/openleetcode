# @param {String} login_time
# @param {String} logout_time
# @return {Integer}
def number_of_rounds(login_time, logout_time)
    def to_minutes(t)
        h, m = t.split(":").map(&:to_i)
        h * 60 + m
    end

    start = to_minutes(login_time)
    finish = to_minutes(logout_time)

    finish += 24 * 60 if finish < start

    start_round = (start + 14) / 15
    end_round = finish / 15

    [0, end_round - start_round].max
end
