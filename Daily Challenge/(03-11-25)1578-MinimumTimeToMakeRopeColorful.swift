class Solution {
    func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
        let arr = Array(colors)
        var total = 0
        var maxTime = neededTime[0]
        
        for i in 1..<arr.count {
            if arr[i] == arr[i-1] {
                total += min(maxTime, neededTime[i])
                maxTime = max(maxTime, neededTime[i])
            } else {
                maxTime = neededTime[i]
            }
        }
        return total
    }
}
