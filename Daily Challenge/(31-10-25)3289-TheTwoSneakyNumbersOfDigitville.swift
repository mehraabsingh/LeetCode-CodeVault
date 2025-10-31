class Solution {
    func getSneakyNumbers(_ nums: [Int]) -> [Int] {
        var count = [Int: Int]()
        var res = [Int]()
        for num in nums {
            count[num, default: 0] += 1
            if count[num]! == 2 {
                res.append(num)
            }
        }
        return res
    }
}
