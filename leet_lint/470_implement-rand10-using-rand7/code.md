# Implement Rand10() Using Rand7()
# 用 Rand7() 实现 Rand10()


## Description
Given a function rand7 which generates a uniform random integer in the range 1 to 7, write a function rand10 which generates a uniform random integer in the range 1 to 10.
Do NOT use system's Math.random().

## Description
已有方法 rand7 可生成 1 到 7 范围内的均匀随机整数，试写一个方法 rand10 生成 1 到 10 范围内的均匀随机整数。
不要使用系统的 Math.random() 方法。



## Example
### Example 1:
    Input: 1
    Output: [7]

### Example 2:
    Input: 2
    Output: [8,4]

### Example 3:
    Input: 3
    Output: [8,1,10]
 

## 示例
### 示例 1:
    输入: 1
    输出: [7]

### 示例 2:
    输入: 2
    输出: [8,4]

### 示例 3:
    输入: 3
    输出: [8,1,10]

## Note
1. rand7 is predefined.
2. Each testcase has one argument: n, the number of times that rand10 is called.

## 说明
1. rand7 已定义。
2. 传入参数: n 表示 rand10 的调用次数。

## Follow up
1. What is the expected value for the number of calls to rand7() function?
2. Could you minimize the number of calls to rand7()?

## 进阶:
1. rand7()调用次数的 期望值 是多少 ?
2. 你能否尽量少调用 rand7() ?


## Solution
### 拒绝采样
我们可以通过更大的范围的随机数来生成范围更小的随机数, 现有的条件的话我们可以同个调用多次的rand7()的方法来取得超过10的范围的数字.

### Code

```java
    //T O(1)
    //S O(1)
    public int rand10() {
        do {
            //第一次和第二次的使用rand7()
            int rand7_1 = rand7();
            int rand7_2 = rand7();
            //映射到1-49的区间
            int current = rand7_2 + (rand7_1 - 1) * 7;
            //当取值小于40的时候,则接受
            if (current <= 40) {
                return 1 + (current - 1) % 10;
            }

            //当值大于40的时候则拒绝, 需要继续采样
            int rand7_3 = rand7();
            //映射到1-63的区间
            current = rand7_3 + (current - 40 - 1) * 7;
            //当取值小于60的时候,则接受
            if (current <= 60) {
                return 1 + (current - 1) % 10;
            }

            //当值大于60的时候则拒绝, 需要继续采样
            int rand7_4 = rand7();
            //映射到1-21的区间
            current = rand7_4 + (current - 60 - 1) * 7;
            //当取值小于60的时候,则接受
            if (current <= 20) {
                return 1 + (current - 1) % 10;
            }
        } while (true);
    }
```