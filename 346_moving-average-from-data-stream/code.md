# Moving Average from Data Stream
# 数据流中的移动平均值

## Description
Given a stream of integers and a window size, calculate the moving average of all integers in the sliding window.

## Description
给定一个整数数据流和一个窗口大小，根据该滑动窗口的大小，计算其所有整数的移动平均值。

## Example
### Example:
    MovingAverage m = new MovingAverage(3);
    m.next(1) = 1
    m.next(10) = (1 + 10) / 2
    m.next(3) = (1 + 10 + 3) / 3
    m.next(5) = (10 + 3 + 5) / 3
     

## 示例
### 示例:
    MovingAverage m = new MovingAverage(3);
    m.next(1) = 1
    m.next(10) = (1 + 10) / 2
    m.next(3) = (1 + 10 + 3) / 3
    m.next(5) = (10 + 3 + 5) / 3


## Solution
### 双端队列
通过使用队列,我们向窗口添加一个新元素,同时从窗口中删除第一个元素.同时为了简化计算, 我们保留前一个移动窗口的总和sum


## Code 

```java
class MovingAverage {
        //队列大小
        int size;
        //队列开始位置
        int head = 0;
        //对应区间和
        int sum = 0;
        //当前统计数量
        int count = 0;
        //循环队列
        int[] queue;

        public MovingAverage(int size) {
            this.size = size;
            //初始化循环队列
            queue = new int[size];
        }

        //T O(1)
        //S O(n)
        public double next(int val) {
            //统计数量
            count++;
            //获取队列尾的信息
            int tail = (head + 1) % size;

            //更新对应区间和
            sum = sum - queue[tail] + val;
            //移动并更新队列头信息
            head = tail;
            queue[head] = val;
            //计算平均值
            return sum * 1.0 / Math.min(size, count);
        }
    }
```