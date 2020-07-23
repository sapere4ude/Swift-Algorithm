# Swift-Algorithm

1. 키보드 입력 받기 & 값 공백으로 구분하기

```
    let nums = readLine()!.split(separator: " ")
    print(nums)
```
  
<br>

2. 배열 다루기

```
    var array = [Int](1...5) // [1, 2, 3, 4, 5]

    print(type(of: array)) // Array<Int>

    let matrix = [[Int]]()  
    let matrix_v2 = [[Int]](repeating: [], count: 3) // [[], [], []]

    print(type(of: matrix)) // Array<Array<Int>>

    array.reverse() // [5, 4, 3, 2, 1]

    array.sorted()  // default는 오름차순이다. 1,2,3 ...

    array.sorted(by: >) // 내림차순 
```

3. map

```
    // 축약형
    var string1 = ["1","2","3","4"]
    let c1 = string1.map{ Int($0)! }

    // 원본
    var string2 = ["1","2","3","4"]
    let c2 = string2.map({(string2: String) -> Int in
        return Int(string2)!
        })

    print(c1)   // [1, 2, 3, 4]
    print(c2)   // [1, 2, 3, 4]

```

4. filter
   
``` 
    // 축약형 
    var array1 = [1,2,3,4]
    let a1 = array1.filter{ $0 % 2 == 0}
    print(a1)

    // 원본
    var array2 = [1,2,3,4]
    let a2 = array2.filter({(array2: Int)-> Bool
        in
        return array2 % 2 == 0
    })
    print(a2)

```
