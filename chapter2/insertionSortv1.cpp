#include <stdio.h>

using namespace std;

int main(){

	int arr[]={6,5,4,3,2,1};
	int size=6;
	int temp;
	int j;

	for(int i=1;i<size;i++){
		j=i-1;
	while(j>=0 && arr[j+1]<arr[j]){
		temp=arr[j];
		arr[j]=arr[j+1];
		arr[j+1]=temp;
		j--;
	}
	}
	
	for(int i=0;i<size;i++) printf("%3d",arr[i]);
	printf("\n");
}
