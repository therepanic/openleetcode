# @param {Integer[][]} courses
# @return {Integer}
def schedule_course(courses)
    courses.sort_by! { |a, b| [b, a] }
    heap = []
    days = 0
    courses.each do |duration, last|
        days += duration
        heap.push(-duration)
        heap.sort!
        if days > last
            top = heap.shift
            days += top
        end
    end
    heap.length
end
