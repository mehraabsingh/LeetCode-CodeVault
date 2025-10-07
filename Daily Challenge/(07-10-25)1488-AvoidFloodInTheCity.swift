class Solution {
    func avoidFlood(_ rains: [Int]) -> [Int] {
        var result = Array(repeating: 1, count: rains.count) // default 1 for dry days
        var fullLakes = [Int: Int]() // lake -> last day it was filled
        var dryDays = [Int]() // store indices of 0s (days we can dry)
        
        for i in 0..<rains.count {
            let lake = rains[i]
            
            if lake > 0 {
                // It's raining on this lake
                result[i] = -1
                
                if let lastFullDay = fullLakes[lake] {
                    // Find a dry day after lastFullDay to dry this lake
                    // Binary search for the first dry day > lastFullDay
                    if let dryIndex = binarySearch(dryDays, target: lastFullDay) {
                        let dryDay = dryDays.remove(at: dryIndex)
                        result[dryDay] = lake // dry this lake on that day
                    } else {
                        // No dry day available before next rain on same lake → flood
                        return []
                    }
                }
                
                // Update lake as filled today
                fullLakes[lake] = i
                
            } else {
                // It's a dry day
                dryDays.append(i)
            }
        }
        
        return result
    }
    
    // Binary search: find first index in dryDays > target
    private func binarySearch(_ arr: [Int], target: Int) -> Int? {
        var left = 0, right = arr.count - 1
        var ans: Int? = nil
        while left <= right {
            let mid = (left + right) / 2
            if arr[mid] > target {
                ans = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return ans
    }
}
