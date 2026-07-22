# @param {Integer[]} salary
# @return {Float}
def average(salary)
    res = salary.max
    res1 = salary.min
    salary.delete(res)
    salary.delete(res1)
    total = 0.0
    salary.each do |i|
        total = total + i
    end
    m = total / salary.length
    return m
end
