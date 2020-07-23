# Daily Temperatures
# 每日温度


## Description
Given a list of daily temperatures T, return a list such that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.

## Description
请根据每日 气温 列表，重新生成一个列表。对应位置的输出为：要想观测到更高的气温，至少需要等待的天数。如果气温在这之后都不会升高，请在该位置用 0 来代替。


## Note
The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].

## 说明
气温列表长度的范围是 [1, 30000]。每个气温的值的均为华氏度，都是在 [30, 100] 范围内的整数。


## Example
For example, given the list of temperatures T = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].
    


## 样例
例如，给定一个列表 temperatures = [73, 74, 75, 71, 69, 72, 76, 73]，你的输出应该是 [1, 1, 4, 2, 1, 1, 0, 0]。


## Solution

### 单调栈
当我们尝试解答题目的时候, 我们会发现我们需要在一个单调递减的区间中需要更大的可能性, 所以这里的话我们可以用一个栈来维护,  这里的话我们比对当前栈顶元素和遍历到的元素信息, 再根据相关逻辑处理即可.

### Code

```java
    //T O(n)
    //S O(n)
    public int[] dailyTemperatures(int[] T) {
        //定义结果集
        int[] result = new int[T.length];

        //单调减的栈
        Stack<Integer> stack = new Stack<>();

        //遍历数组
        for (int i = 0; i < T.length; i++) {
            //获取当前值
            int current = T[i];
            //判断当前值是否大于栈顶元素
            while (!stack.isEmpty() && current > T[stack.peek()]) {
                //出栈元素, 更新对应位置内容
                int prevIndex = stack.pop();
                result[prevIndex] = i - prevIndex;
            }
            //入栈元素
            stack.push(i);
        }
        return result;
    }

```