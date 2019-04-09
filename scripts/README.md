LEARNING BASH BY USE CASE
=========================

Mình thấy có hai kiểu học, một kiểu là học có bài bản dựa trên tutorial đàng hoàng, một kiểu là học theo use case cụ thể (kiểu adhoc). 
Hai kiểu học điều có ưu nhược điểm của nó. 
Mình hay đụng tới đâu đọc tới đó (kiểu ad hoc), làm xong rồi cho qua, không hệ thống lại, thành ra làm xong là quên sạch.
Học theo cách này riết rồi kiến thức của mình sẽ dàn trải, nhiều nhưng không chất. 
Nhất là thói quen search stackoverflow xong rồi copy paste cho chạy mà không review lại để hiểu bản chất.  
Điều này không tốt khi đi phỏng vấn chuyên sâu. 
Học theo kiểu tutorial thì mất quá nhiều thời gian, đọc xong hết một cách cẩn thận là trễ deadline luôn, và cảm thấy nhàm chán nữa 
(thường đọc tutorial mà không tương tác, code này nọ là dễ buồn ngủ lắm :zzz). 

Giải pháp là học theo use case trước để chạy việc xong, rồi quay trở lại học theo tutorial. 
Làm xong lần đầu va vấp đủ thứ thì đọc lại tutorial lại ngộ ra được nhiều thứ. 


Bài viết này mình phân tích một bash cụ thể vừa đọc vừa học Bash cho thú vị hơn.
Chúng ta hãy tham khảo script install docker nhé: https://get.docker.com/

<script src="https://gist.github.com/tuyen03a128/d0de57ca60a47b7bdab7ae2d799fd143.js"></script>

Tham khảo:
https://www.geeksforgeeks.org/introduction-linux-shell-shell-scripting/
http://tldp.org/LDP/abs/html/why-shell.html


Table of Contents
-----------------
  1. [Testing whether a string is null](#Testing-whether-a-string-is-null)
    a. [If else](#If-else) 
    b. [ [ -z "$String" ] ](#String-Comparison--z-Operator )
    c. [ [ -n "$String" ] ](#String-Comparison--n-Operator)
  2. Man test 
  3. [Write options](#Write-options)
    a. Cases
    b. Positional Parameters
    c. Dry run 
 
  
### Testing whether a string is null 
 
Thường sử dụng trước khi gán giá trị cho một biến. 

Example: Check if variable is assigned or not 
`DEFAULT_CHANNEL_VALUE="stable"
if [ -z "$CHANNEL" ]; then        
	CHANNEL=$DEFAULT_CHANNEL_VALUE
fi
`

Tham khảo: http://tldp.org/LDP/abs/html/comparison-ops.html


#### If else

`if some-commands;
then then-commands
else else-commands
fi
`
some-commands is found to be true or it return status 0

Tham khảo: 

#### String Comparison -z Operator 
 > if [ -z "$CHANNEL" ]; then  # check $CHANNEL is null
   
[ -z "$String" ] : String comparison 
string is null, that is, has zero length 

`if [ -z "$string" ]
then
    echo "\$String is null."
else
    echo "\$String is not null."
fi
`
> [ -z "$string1" ] && echo "String1 is null"
-> Show "String1 is null"

> [ -z $string1 ] && echo "String1 is null"
-> Show "String1 is null"

This works with unquoted/quoted string within test brackets

#### String Comparison -n Operator 
[ -n "$quotedString" ]

string is not null. Always quote a tested string. 

[]: test brackets
"": quote
 
Best practice: Luôn luôn quote "" một chuỗi (string) trong []

Using test man or man [ to test quoted/unquoted string in test brackets:

<script src="https://gist.github.com/tuyen03a128/0f5f935ef87774fee707920cdb75ade3.js"></script>

string1 has not been initialized, it has no defined value

1. Non-quote string in test brackets. Wrong results !
> [ -n $string1 ] &&  echo "String1 is not null"
-> Show "String1 is not null" --> Wrong results. 
2. Quote string within test brackets. 
> [ -n "$string1"] && echo "String1 is not null"
->    --> This works fines 
3. string1 stands naked. Must quoting. See the following examples
    3.1 Unquoted
> [ $string1 ] && echo "String1 is not null"
->   --> This works fine.
> string1="a = b"
> [ $string1 ] && echo "String1 is not null"
->   --> Wrong result ! 
    3.2 Quoted
> string1="a = b"
> [ "$string1" ] && echo "String1 is not null"
-> Show "String1 is not null"  --> This works fine

### Man test or Man [
> man test 

> [ EXPRESSION ]

Dùng để kiểm tra giá trị của một expression 

### Write options

Example: 

`
mirror=''
DRY_RUN=${DRY_RUN:-}
while [ $# -gt 0 ]; do  
	case "$1" in
		--mirror)
			mirror="$2"
			shift
			;;
		--dry-run)
			DRY_RUN=1
			;;
		--*)
			echo "Illegal option $1"
			;;
	esac
	shift $(( $# > 0 ? 1 : 0 ))
done
`
#### Case

Tham khảo: http://tldp.org/LDP/abs/html/testbranch.html#EX29

#### Positional parameters
`while [ $# -gt 0 ]; do` 
$#: number of command-line arguments 

`case "$1" in`
$0: function 
$1: argument 1 
$2: argument 2

$*: all of the positional parameters ($1, $2, ...). Must be quoted. "$*" 
S@: same $*, but each parameter is a quoted string, is seen as a separate word. Must be quoted. "$@"
${@:-}
${@:1}
${@:2}

$-
$!
$_
$?
$$

<script src="https://gist.github.com/tuyen03a128/2f15718a066dc694130e382cc446c899.js"></script>

Tham khảo: http://tldp.org/LDP/abs/html/internalvariables.html#ARGLIST

#### Integer comparison -gt  
2 cách viết: 
1. [ "$a" -gt "$b" ] 
2. (("$a" > "$b"))  <-- double parentheses

>a=10
>b=5
>[ "$a" -gt "$b" ] && echo "a is greater than b"
-> Show "a is greater than b"
> (("$a" > "$b")) && echo "a is greater than b"
-> Show "a is greater than b"

Tham khảo: http://tldp.org/LDP/abs/html/comparison-ops.html


#### Dry run 

Show commands without executing them
set -x 
set -n 



**[Back to top](#table-of-contents)**



