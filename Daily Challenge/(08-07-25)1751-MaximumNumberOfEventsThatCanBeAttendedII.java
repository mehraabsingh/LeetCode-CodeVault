class Solution {
    func maxValue(_ events: [[Int]], _ k: Int) -> Int {
        // Sort events based on start day
        let sortedEvents = events.sorted { $0[0] < $1[0] }
        let n = sortedEvents.count
        
        // Memoization table: dp[i][k]
        var memo = Array(repeating: Array(repeating: -1, count: k + 1), count: n)
        
        // Binary search to find the next event index that can be attended
        func findNext(_ index: Int) -> Int {
            var low = index + 1
            var high = n
            let endDay = sortedEvents[index][1]
            while low < high {
                let mid = (low + high) / 2
                if sortedEvents[mid][0] > endDay {
                    high = mid
                } else {
                    low = mid + 1
                }
            }
            return low
        }
        
        func dp(_ i: Int, _ remaining: Int) -> Int {
            if i >= n || remaining == 0 {
                return 0
            }
            if memo[i][remaining] != -1 {
                return memo[i][remaining]
            }
            
            let skip = dp(i + 1, remaining)
            
            let nextIndex = findNext(i)
            let take = sortedEvents[i][2] + dp(nextIndex, remaining - 1)
            
            memo[i][remaining] = max(skip, take)
            return memo[i][remaining]
        }
        
        return dp(0, k)
    }
}
