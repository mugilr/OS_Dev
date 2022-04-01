int fun1(){
	int a = 12%2;
	return 0x12;
}
int fun2(){
	int i=1234;
	return 0x123f;
}
int fun3(){
	int i=34;
	int j=i;
	return 0x123f;
}
int add(int a, int b){
	return a+b;
}
int caller(){
	int res= add(2,3);
}
int addp(int *a, int *b){
	return *a + *b;
}
int callerp(){
	int res= add(2,3);
}
