#include <iostream>
using namespace std;

class GrainCounter
{
	private:
		int litres;
		int makopokopo;
		int remainder;
		
	public:
		GrainCounter(int l);
		void calculateMakopokopo();
		void displayResult() const;	
};
GrainCounter::GrainCounter(int l)
{
	if (l<0){
		cout << " invalid input, litres cannot be negative " << endl;
		litres = 0;
	}
	else{
		makopokopo = 0;
		remainder = 0;
	}
}

void GrainCounter::calculateMakopokopo()
{
	int temp = litres;
	int size = 20;
	while(temp >= size)
	{
		temp -= size;
		makopokopo++;
	}
	remainder = temp;
}

void GrainCounter::displayResult() const
{
	cout << " Number of makopokopo: " << makopokopo << endl;
	cout << " Remainder is: " << remainder << endl;
}

int main()
{
	int litres;
	cout << " enter quantity of grains in litres: " << endl;
	cin >> litres;
	
	GrainCounter counter(litres);
	counter.calculateMakopokopo();
	counter.displayResult();
	return 0;
}
