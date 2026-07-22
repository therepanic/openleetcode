# @param {Integer[]} job_difficulty
# @param {Integer} d
# @return {Integer}
def min_difficulty(job_difficulty, d)
    length = job_difficulty.length
    return -1 if d > length

    min_difficulties = Array.new(d) { Array.new(length, Float::INFINITY) }

    max_diff = 0
    i = 0
    while i <= length - d
        max_diff = [max_diff, job_difficulty[i]].max
        min_difficulties[0][i] = max_diff
        i += 1
    end

    current_day = 1
    while current_day < d
        to = current_day
        while to <= length - d + current_day
            current_job_difficulty = job_difficulty[to]
            result = Float::INFINITY
            j = to - 1
            while j >= current_day - 1
                result = [result, min_difficulties[current_day - 1][j] + current_job_difficulty].min
                current_job_difficulty = [current_job_difficulty, job_difficulty[j]].max
                j -= 1
            end
            min_difficulties[current_day][to] = result
            to += 1
        end
        current_day += 1
    end

    min_difficulties[d - 1][length - 1].to_i
end
