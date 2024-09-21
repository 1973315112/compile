define i32 @main() #0 {
	; 声明变量:int a,b,i,t,n;
	%1 = alloca i32, align 4
	%2 = alloca i32, align 4
	%3 = alloca i32, align 4
	%4 = alloca i32, align 4
	%5 = alloca i32, align 4
	; 初始化:a=0;b=1;i=1; 
	store i32 0, i32* %1, align 4
	store i32 1, i32* %2, align 4
	store i32 1, i32* %3, align 4
	; 输入输出: cin>>n; cout<<a<<endl; cout<<b<<endl;
	%6 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %5)
	%7 = load i32, i32* %1, align 4
	%8 = load i32, i32* %2, align 4	
	%9   = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %7)
	%10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %8)
	br label %11
11:									;preds=%0,%15
	;循环的跳转:while(i<n)
	%12 = load i32, i32* %3, align 4
	%13 = load i32, i32* %5, align 4
	%14 = icmp slt i32 %12, %13
	br i1 %14, label %15, label %22

15:									;preds=%11
	; a+b
	%16 = load i32, i32* %1, align 4
	%17 = load i32, i32* %2, align 4
	%18 = add i32 %16, %17
	; cout<<a+b<<endl;
	%19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 %18)	
	; 更新变量 t=b; b=a+b; a=t; i=i+1;
	store i32 %17, i32* %4, align 4
	store i32 %18, i32* %2, align 4
	store i32 %17, i32* %1, align 4
	%20 = load i32, i32* %3, align 4
	%21 = add nsw i32 %20, 1
	store i32 %21, i32* %3, align 4
	br label %11

22:									;preds=%11
	;return 0;
	ret i32 0
}
; 函数声明
declare dso_local i32 @__isoc99_scanf(i8*, ...)
declare dso_local i32 @printf(i8*, ...)
@.str = private constant [3 x i8] c"%d\00"
@.str.1 = private constant [3 x i8] c"%d "

