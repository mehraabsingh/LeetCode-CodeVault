class Solution {
    func maximumTotalDamage(_ power: [Int]) -> Int {
        // Step 1: Aggregate total damage for each unique power
        var damageMap = [Int: Int]()
        for p in power {
            damageMap[p, default: 0] += p
        }
        
        // Step 2: Sort the unique powers
        let unique = damageMap.keys.sorted()
        let n = unique.count
        var dp = [Int](repeating: 0, count: n)
        
        // Step 3: DP computation
        for i in 0..<n {
            let currentDamage = damageMap[unique[i]]!
            
            // Find last index j such that unique[i] - unique[j] > 2
            var j = i - 1
            while j >= 0 && unique[i] - unique[j] <= 2 {
                j -= 1
            }
            
            // Take or skip
            let take = currentDamage + (j >= 0 ? dp[j] : 0)
            let skip = i > 0 ? dp[i - 1] : 0
            dp[i] = max(take, skip)
        }
        
        return dp[n - 1]
    }
}
