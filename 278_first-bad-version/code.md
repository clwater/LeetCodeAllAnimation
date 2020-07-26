# First Bad Version
# 第一个错误的版本

## Description
You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.


## Description
你是产品经理，目前正在带领一个团队开发新的产品。不幸的是，你的产品的最新版本没有通过质量检测。由于每个版本都是基于之前的版本开发的，所以错误的版本之后的所有版本都是错的。

假设你有 n 个版本 [1, 2, ..., n]，你想找出导致之后所有版本出错的第一个错误的版本。

你可以通过调用 bool isBadVersion(version) 接口来判断版本号 version 是否在单元测试中出错。实现一个函数来查找第一个错误的版本。你应该尽量减少对调用 API 的次数。


## Example
    Given n = 5, and version = 4 is the first bad version.

    call isBadVersion(3) -> false
    call isBadVersion(5) -> true
    call isBadVersion(4) -> true

    Then 4 is the first bad version. 


## 示例
    给定 n = 5，并且 version = 4 是第一个错误的版本。

    调用 isBadVersion(3) -> false
    调用 isBadVersion(5) -> true
    调用 isBadVersion(4) -> true

    所以，4 是第一个错误的版本。 


## Solution

### 二分法
这个题目我们观察后可以发现可以通过二分法来解决, 不过需要注意对左右区间的更新.

### Code

```java
    //T O(log n)
    //S O(1)
    public int firstBadVersion(int n) {
        //左右区间
        int left = 1;
        int right = n;
        //遍历
        while (left < right){
            //计算中间部分
            int middle = left + (right - left) / 2;
            //判断当前是否为话版本
            if (isBadVersion(middle)){
                //更新右侧区间结束为当前位置
                right = middle;
            }else {
                //更新左侧区间为当前位置右侧
                left = middle + 1;
            }
        }
        return left;
    }
```