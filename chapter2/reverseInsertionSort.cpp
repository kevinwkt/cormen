#include <stdio.h>

using namespace std;

int main(){

	int arr[]={1,2,3,4,5,6,7};
	int size=7;
	int temp;
	int j;

	for(int i=1;i<size;i++){
		j=i-1;
	while(j>=0 && arr[j+1]>arr[j]){
		temp=arr[j];
		arr[j]=arr[j+1];
		arr[j+1]=temp;
		j--;
	}
	}
	
	for(int i=0;i<size;i++) printf("%3d",arr[i]);
	printf("\n");
}
