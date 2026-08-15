# @param {Integer[]} students
# @param {Integer[]} sandwiches
# @return {Integer}
def count_students(students, sandwiches)
    c = 0
    while !students.empty?
        if students[0] == sandwiches[0]
            sandwiches.shift
            students.shift
            c = 0
        else
            students << students.shift
            c += 1
        end
        break if c == students.length
    end
    students.length
end
