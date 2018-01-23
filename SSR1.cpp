#include<iostream>
using namespace std;
int arr1[6];
class sorting
{
int arr[6];
public:
void quicksort();
void mergesort();
void inssort();
void setter();
void getter();
};

 void sorting::inssort()
{
	for(int i=0;i<6;i++)
	{
	arr1[i]=arr[i];
	}
int j,temp;
for(int i=1; i<6; i++)
	{
		temp=arr1[i];
		j=i-1;
		while((temp<arr[j]) && (j>=0))
		{
			arr1[j+1]=arr1[j];
			j=j-1;
		}
		arr1[j+1]=temp;
	}

}


 void sorting::mergesort()
{
	for(int i=0;i<6;i++)
	{
	arr1[i]=arr[i];
	}


}


void sorting::quicksort()
{
	for(int i=0;i<6;i++)
	{
	arr1[i]=arr[i];
	}


}


void sorting::setter()
{
cout<<"Enter the elements into the array\n";
for(int i=0;i<6;i++)
	{
	 cin>>arr[i];
	}
}


void sorting::getter()
{
cout<<"the sorted elements are:"<<endl;
	for(int i=0;i<6;i++)
	{
	 cout<<arr1[i]<<"\t";
	}	
}






int main()
{
int choice,subchoice;
sorting ob;
ob.setter();
do
{
cout<<"\nEnter \n 1.to perform quicksort \n 2.to perform mergesort \n 3.to perform insertionsort \n 4.Exit\n";
cin>>choice;
	switch(choice)
	{
	case 1:
	ob.quicksort();
	cout<<"Do you wish the sorted elements to be displayed?  Press 1 for yes,Press 0 for no"<<"\n";
	cin>>subchoice;
		if(subchoice==1)
		{
		ob.getter();
		}
	break;

	case 2:
	ob.mergesort();
	cout<<"Do you wish the sorted elements to be displayed?  Press 1 for yes,Press 0 for no"<<"\n";
	cin>>subchoice;
		if(subchoice==1)
		{
		ob.getter();
		}
	break;

	case 3:
	ob.inssort();
	cout<<"Do you wish the sorted elements to be displayed?  Press 1 for yes,Press 0 for no"<<"\n";
	cin>>subchoice;
		if(subchoice==1)
		{
		ob.getter();
		}
	break;

	case 4:
	cout<<"Exiting program";
	break;

	default :
	cout<<"Wrong choice,try again\n";
	break;
	}

}while(choice!=4);
};
	
