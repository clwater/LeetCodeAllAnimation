# Implement Rand10() Using Rand7()
# 分糖果


## Description
Given an integer array with even length, where different numbers in this array represent different kinds of candies. Each number means one candy of the corresponding kind. You need to distribute these candies equally in number to brother and sister. Return the maximum number of kinds of candies the sister could gain.

## Description
给定一个偶数长度的数组，其中不同的数字代表着不同种类的糖果，每一个数字代表一个糖果。你需要把这些糖果平均分给一个弟弟和一个妹妹。返回妹妹可以获得的最大糖果的种类数。



## Example
### Example 1:
    Input: candies = [1,1,2,2,3,3]
    Output: 3
    Explanation:
    There are three different kinds of candies (1, 2 and 3), and two candies for each kind.
    Optimal distribution: The sister has candies [1,2,3] and the brother has candies [1,2,3], too. 
    The sister has three different kinds of candies. 

### Example 2:
    Input: candies = [1,1,2,3]
    Output: 2
    Explanation: For example, the sister has candies [2,3] and the brother has candies [1,1]. 
    The sister has two different kinds of candies, the brother has only one kind of candies. 


## 示例
### 示例 1:
    输入: candies = [1,1,2,2,3,3]
    输出: 3
    解析: 一共有三种种类的糖果，每一种都有两个。
        最优分配方案：妹妹获得[1,2,3],弟弟也获得[1,2,3]。这样使妹妹获得糖果的种类数最多。


### 示例 2:
    输入: candies = [1,1,2,3]
    输出: 2
    解析: 妹妹获得糖果[2,3],弟弟获得糖果[1,1]，妹妹有两种不同的糖果，弟弟只有一种。这样使得妹妹可以获得的糖果种类数最多。


## Note
1. The length of the given array is in range [2, 10,000], and will be even.
2. The number in given array is in range [-100,000, 100,000].

## 说明
1. 数组的长度为[2, 10,000]，并且确定为偶数。
2. 数组中数字的大小在范围[-100,000, 100,000]内。



## Solution
### 排序及集合
这个题目可以理解为我们需要找到给定的数组中有多少个不重复的元素, 只不过最后的结果不能大于数组长度的一半. 这么理解起来还是比较容易了.


### Code

```java
    //T O(n log n)
    //S O(1)
    //排序
    public int distributeCandies(int[] candies) {
        //排序
        Arrays.sort(candies);

        //结果
        int result = 1;

        //遍历数组
        for (int i = 1; i < candies.length && result < candies.length / 2; i++) {
            //查看和前一个元素是否不同
            if (candies[i] > candies[i - 1]){
                result++;
            }
        }

        return result;
    }

    //T O(n)
    //S O(1)
    //集合
    public int distributeCandies(int[] candies) {
        //定义set
        HashSet<Integer> set = new HashSet<>();
        //遍历数组, 过滤重复的元素
        for (int candie : candies){
            set.add(candie);
        }

        //比较结果
        return Math.min(set.size(), candies.length / 2);
    }
```