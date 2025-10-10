class Solution {
    func maximumEnergy(_ energy: [Int], _ k: Int) -> Int {
        var dp = energy
        let n = energy.count
        
        for i in stride(from: n - 1 - k, through: 0, by: -1) {
            dp[i] += dp[i + k]
        }
        
        return dp.max() ?? 0
    }
}
