#include <stdio.h>

using namespace std;

int main(){

	int arr[]={6,5,4,3,2,1};
	int size=6;
	int temp;
	int j;
	for(int i=1;i<size;i++){
		j=i-1;
		temp=arr[i];
		while(j>=0 && temp<arr[j]){
			arr[j+1]=arr[j];
			j--;
		}
		arr[j+1]=temp;
//		for(int i=0;i<size;i++)printf("%3d",arr[i]);
//		printf("\n");
	}
	
	for(int i=0;i<size;i++) printf("%3d",arr[i]);
	printf("\n");
}
