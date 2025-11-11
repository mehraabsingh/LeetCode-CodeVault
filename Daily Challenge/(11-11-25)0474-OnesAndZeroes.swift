class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        for str in strs {
            let zeros = str.filter { $0 == "0" }.count
            let ones = str.count - zeros
            for i in stride(from: m, through: zeros, by: -1) {
                for j in stride(from: n, through: ones, by: -1) {
                    dp[i][j] = max(dp[i][j], dp[i - zeros][j - ones] + 1)
                }
            }
        }
        return dp[m][n]
    }
}
