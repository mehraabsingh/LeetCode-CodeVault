class Solution {
    func sumZero(_ n: Int) -> [Int] {
        var ans = [Int](repeating: 0, count: n)
        
        for i in 0..<n {
            ans[i] = i * 2 - n + 1
        }
        
        return ans
    }
}
