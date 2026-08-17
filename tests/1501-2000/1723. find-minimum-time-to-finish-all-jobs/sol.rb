# @param {Integer[]} jobs
# @param {Integer} k
# @return {Integer}
def minimum_time_required(jobs, k)
    jobs.sort! { |a, b| b <=> a }
    left, right = jobs.max, jobs.sum
    
    can_distribute = lambda do |max_workload|
        workers = Array.new(k, 0)
        
        assign_job = lambda do |job_index|
            return true if job_index == jobs.length
            (0...k).each do |i|
                if workers[i] + jobs[job_index] <= max_workload
                    workers[i] += jobs[job_index]
                    return true if assign_job.call(job_index + 1)
                    workers[i] -= jobs[job_index]
                end
                break if workers[i] == 0
            end
            false
        end
        
        assign_job.call(0)
    end
    
    while left < right
        mid = (left + right) / 2
        if can_distribute.call(mid)
            right = mid
        else
            left = mid + 1
        end
    end
    
    left
end
