# Short Encoding of Words
# 单词的压缩编码

## Description
Given a list of words, we may encode it by writing a reference string S and a list of indexes A.
For example, if the list of words is ["time", "me", "bell"], we can write it as S = "time#bell#" and indexes = [0, 2, 5].
Then for each index, we will recover the word by reading from the reference string from that index until we reach a "#" character.
What is the length of the shortest reference string S possible that encodes the given words?

## Description
给定一个单词列表，我们将这个列表编码成一个索引字符串 S 与一个索引列表 A。
例如，如果这个列表是 ["time", "me", "bell"]，我们就可以将其表示为 S = "time#bell#" 和 indexes = [0, 2, 5]。
对于每一个索引，我们可以通过从字符串 S 中索引的位置开始读取字符串，直到 "#" 结束，来恢复我们之前的单词列表。
那么成功对给定单词列表进行编码的最小字符串长度是多少呢？



## Example
    Input: words = ["time", "me", "bell"]
    Output: 10
    Explanation: S = "time#bell#" and indexes = [0, 2, 5].

## 示例
    输入: words = ["time", "me", "bell"]
    输出: 10
    说明: S = "time#bell#" ， indexes = [0, 2, 5] 。

## Note
###   Note:
    1 <= words.length <= 2000.
    1 <= words[i].length <= 7.
    Each word has only lowercase letters.

## 提示
  1 <= words.length <= 2000
  1 <= words[i].length <= 7
  每个单词都是小写字母 。


## Solution
### 字典树
我们的目标就是保留所有不是其他单词后缀的单词,最后的结果就是这些单词长度加一的总和.为了找到是否不同的单词具有相同的后缀.我们可以将其反序之后插入字典树中


## Code 

```java
//T O(∑w[i])
    //S O(s * ∑w[i])
    public int minimumLengthEncoding(String[] words) {
        //构建字典树
        TreeNode tree = new TreeNode();
        //储存树的每个节点
        //方便后期遍历查找
        HashMap<TreeNode, Integer> nodes = new HashMap();


        //遍历每一个字符串
        for (int i = 0; i < words.length; i++) {
            String word = words[i];
            TreeNode index = tree;

            //倒叙将字符串中的每一个字符插入字典树中
            for (int j = word.length() - 1; j >= 0; j--) {
                index = index.getChild(word.charAt(j));
            }

            //储存节点信息
            nodes.put(index, i);

        }

        int result = 0;

        //遍历树的子节点
        for (TreeNode node : nodes.keySet()) {
            //判断当前节点是否为叶子节点
            if (node.childCount == 0) {
                //累加对应字符的长度
                //因为需要#字符分割, 所以需要额外+1
                result += words[nodes.get(node)].length() + 1;
            }
        }
        return result;

    }



    //字典树
    class TreeNode {

        //子节点
        TreeNode[] children;

        //子节点数量
        int childCount;

        TreeNode() {
            //储存最多的26个字符
            children = new TreeNode[26];
            //子节点数量默认为0
            childCount = 0;
        }

        //获取储存字符c的下一个子节点
        public TreeNode getChild(char c) {
            //如果子节点不存在的话则构建其子节点
            if (children[c - 'a'] == null) {
                children[c - 'a'] = new TreeNode();
                //增加其子节点计数
                childCount++;
            }
            //返回其子节点
            return children[c - 'a'];
        }

    }


```