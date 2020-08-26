# Merge Intervals
# 合并区间

## Description
Given a collection of intervals, merge all overlapping intervals.

## Description
给出一个区间的集合，请合并所有重叠的区间。

## Example
### Example 1:
    Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
    Output: [[1,6],[8,10],[15,18]]
    Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

### Example 2:
    Input: intervals = [[1,4],[4,5]]
    Output: [[1,5]]
    Explanation: Intervals [1,4] and [4,5] are considered overlapping.
    NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
      Constraints:
    intervals[i][0] <= intervals[i][1]

## 示例
### 示例 1:
    输入: intervals = [[1,3],[2,6],[8,10],[15,18]]
    输出: [[1,6],[8,10],[15,18]]
    解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].

### 示例 2:
    输入: intervals = [[1,4],[4,5]]
    输出: [[1,5]]
    解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
    注意：输入类型已于2019年4月15日更改。 请重置默认代码定义以获取新方法签名。

## 提示
* intervals[i][0] <= intervals[i][1]


## Solution
### 双指针
这里我们采用了先排序后使用双指针排序的方法, 针对排序后的有序数组, 我们可以定义开始和结束的双指针来解决.


## Code 

```java
//T O(n log n))
    //S O(log n)
    public int[][] merge(int[][] intervals) {
        // 排序优化
        Arrays.sort(intervals, new Comparator<int[]>() {
            @Override
            public int compare(int[] o1, int[] o2) {
                //如果两个数组首尾相同,则比较末位情况
                if(o1[0] == o2[0]){
                    return o1[1] - o2[1];
                }else {
                    return o1[0] - o2[0];
                }
            }
        });

        //结果集
        int[][] result = new int[intervals.length][2];
        //结果的数量
        int resultCount = 0;

        //双指针循环
        for (int i = 0; i < intervals.length; ) {
            //合并区间(第一个指针)开始的位置
            int start = intervals[i][0];
            //合并区间(第一个指针)结束的位置
            int end = intervals[i][1];

            //第二个指针
            int j = i + 1;

            //判断第二个区间是否和第一个的区间重叠
            while (j < intervals.length && intervals[j][0] <= end){
                //更新区间结束的位置
                end = Math.max(end, intervals[j][1]);
                //移动第二个指针
                j++;
            }

            //将合并后的区间加入结果集中
            result[resultCount++] = new int[] {start, end};
            //移动第一个指针
            i = j;
        }

        return Arrays.copyOf(result, resultCount);
    }
```