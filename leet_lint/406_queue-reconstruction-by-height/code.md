# Queue Reconstruction by Height
# 根据身高重建队列


## Description
Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.

## Description
假设有打乱顺序的一群人站成一个队列。 每个人由一个整数对(h, k)表示，其中h是这个人的身高，k是排在这个人前面且身高大于或等于h的人数。 编写一个算法来重建这个队列。




## Example
    Input:
    [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]

    Output:
    [[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
 

## 示例
    输入:
    [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]

    输出:
    [[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]


## Note
The number of people is less than 1,100.

## 说明
总人数少于1100人。



## Solution
### 贪心
在完成题目的过程中, 我们可以发现, 针对已经排列好的个子比较高的队列中, 任意插入个子比较矮的数字都不影响已经排序好的队列.

### Code

```java
    //T O(n^2)
    //S O(n)
    public int[][] reconstructQueue(int[][] people) {
        //对数组进行排序
        Arrays.sort(people, new Comparator<int[]>() {
            @Override
            public int compare(int[] o1, int[] o2) {
                //如果两人高度一样, 则比较k值
                return o1[0] == o2[0] ? o1[1] - o2[1] : o2[0] - o1[0];
            }
        });

        //定义结果
        //这里使用list方便插入到指定位置
        List<int[]> result = new ArrayList<>();

        for (int[] p : people) {
            //将排序好的数组元素安装顺序插入到指定位置
            result.add(p[1], p);
        }

        //这里转换为二维数组返回
        return result.toArray(new int[people.length][2]);
    }
```