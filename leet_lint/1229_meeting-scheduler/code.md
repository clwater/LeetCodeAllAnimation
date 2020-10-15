# 安排会议日程

## Description
你是一名行政助理，手里有两位客户的空闲时间表：slots1 和 slots2，以及会议的预计持续时间 duration，请你为他们安排合适的会议时间。
「会议时间」是两位客户都有空参加，并且持续时间能够满足预计时间 duration 的 最早的时间间隔。

如果没有满足要求的会议时间，就请返回一个 空数组。

 「空闲时间」的格式是 [start, end]，由开始时间 start 和结束时间 end 组成，表示从 start 开始，到 end 结束。 

题目保证数据有效：同一个人的空闲时间不会出现交叠的情况，也就是说，对于同一个人的两个空闲时间 [start1, end1] 和 [start2, end2]，要么 start1 > end2，要么 start2 > end1。




## 示例
### 示例 1：

    输入：slots1 = [[10,50],[60,120],[140,210]], slots2 = [[0,15],[60,70]], duration = 8
    输出：[60,68]

### 示例 2：
    输入：slots1 = [[10,50],[60,120],[140,210]], slots2 = [[0,15],[60,70]], duration = 12
    输出：[]

## Solution
### 双指针
当我们在线段中表示这几个区间的时候, 我们可以很容易的就讲这个问题转化为线段的区间问题, 我们可以定义两个指针, 分别指向重合区间的左侧和右侧, 我们这里移动区间右侧较小的区间, 不断的更新重合的区间, 寻找到符合的区间就可以了.

### Code

```java
    //T O(m+n)
    //S O(1)
    public List<Integer> minAvailableDuration(int[][] slots1, int[][] slots2, int duration) {

        //根据结束情况升序排序
        Arrays.sort(slots1, Comparator.comparingInt(a -> a[1]));
        Arrays.sort(slots2, Comparator.comparingInt(a -> a[1]));

        //遍历两个数组
        for (int i = 0, j = 0; i < slots1.length && j < slots2.length; ) {
            //左指针为当前开始最右侧的情况
            int start = Math.max(slots1[i][0], slots2[j][0]);
            //右指针为当前结束最左侧情况
            int end = Math.min(slots1[i][1], slots2[j][1]);

            //查看当前两个指针区间是否满足
            if (end - start >= duration){
                return Arrays.asList(start, start + duration);
            }

            //移动结束位置较小的指针
            if (slots1[i][1] < slots2[j][1]) {
                i++;
            } else {
                j++;
            }
        }
        return new ArrayList<>();
    }

```