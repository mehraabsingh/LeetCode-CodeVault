class Solution {
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
        let sortedMeetings = meetings.sorted { $0[0] < $1[0] }

        var freeRooms = Heap<Int>(sort: <)
        for i in 0..<n {
            freeRooms.insert(i)
        }

        var busyRooms = Heap<(Int, Int)>(sort: { $0.0 < $1.0 || ($0.0 == $1.0 && $0.1 < $1.1) })

        var count = [Int](repeating: 0, count: n)

        for meeting in sortedMeetings {
            let start = meeting[0]
            let end = meeting[1]
            let duration = end - start

            while let top = busyRooms.peek(), top.0 <= start {
                busyRooms.remove()
                freeRooms.insert(top.1)
            }

            if let room = freeRooms.remove() {
                count[room] += 1
                busyRooms.insert((start + duration, room))
            } else if let (nextAvailable, room) = busyRooms.remove() {
                count[room] += 1
                busyRooms.insert((nextAvailable + duration, room))
            }
        }

        var maxMeetings = 0
        var resultRoom = 0
        for i in 0..<n {
            if count[i] > maxMeetings {
                maxMeetings = count[i]
                resultRoom = i
            }
        }
        return resultRoom
    }
}

struct Heap<T> {
    var elements = [T]()
    let sort: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    var isEmpty: Bool { elements.isEmpty }

    func peek() -> T? {
        elements.first
    }

    mutating func insert(_ value: T) {
        elements.append(value)
        siftUp(elements.count - 1)
    }

    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        if elements.count == 1 {
            return elements.removeFirst()
        } else {
            let value = elements[0]
            elements[0] = elements.removeLast()
            siftDown(0)
            return value
        }
    }

    private mutating func siftUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func siftDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent

            if left < elements.count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < elements.count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}
