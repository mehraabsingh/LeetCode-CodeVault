class Solution {
    func peopleAwareOfSecret(_ n: Int, _ delay: Int, _ forget: Int) -> Int {
        let MOD = 1_000_000_007
        var share: Int64 = 0
        var dp = Array(repeating: 0, count: n) // dp[i] = new people who learn on day i
        dp[0] = 1
        
        for i in 1..<n {
            if i - delay >= 0 {
                share += Int64(dp[i - delay])
            }
            if i - forget >= 0 {
                share -= Int64(dp[i - forget])
            }
            share = (share % Int64(MOD) + Int64(MOD)) % Int64(MOD)
            dp[i] = Int(share)
        }
        
        var ans = 0
        for i in max(0, n - forget)..<n {
            ans = (ans + dp[i]) % MOD
        }
        return ans
    }
}
