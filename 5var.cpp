#include <iostream>
#include <string>
#include <cstring>
#include <map>
#include <unistd.h>
#include <sys/wait.h>

#include <iostream>
using namespace std;

int main()
{
	int mas[10]={-12, 122, 43, -41, -75, -934, 5, 12, 27, 100};
		int i, sum=0;
		for (i=0;i<10;i++)
		{
				if (mas[i]<0){
						mas[i]= -1*mas[i];}
				sum= sum+mas[i];
		}
cout<<"sum:"<<sum<<endl;
		return 0;
}