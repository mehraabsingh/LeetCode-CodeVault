class Solution {
    func new21Game(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
        // Base cases
        if k == 0 || n >= k - 1 + maxPts {
            return 1.0
        }
        
        var dp = [Double](repeating: 0.0, count: n + 1)
        dp[0] = 1.0
        
        var windowSum: Double = 1.0  // rolling sum of probabilities
        var result: Double = 0.0
        
        for i in 1...n {
            dp[i] = windowSum / Double(maxPts)
            
            if i < k {
                windowSum += dp[i]   // can still draw more
            } else {
                result += dp[i]      // game ends here
            }
            
            if i - maxPts >= 0 {
                windowSum -= dp[i - maxPts] // slide window
            }
        }
        
        return result
    }
}
