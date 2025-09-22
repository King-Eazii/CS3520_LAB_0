#include <iostream>
#include <string>
using namespace std;

class CattleWealth
{
	private:
    int cattleCount;   // number of cattle

public:
    // Constructor
    CattleWealth(int count);

    // Classification prototype
    string classifyWealth() const;

    // Display results
    void displayResult() const;
};

// Constructor implementation
CattleWealth::CattleWealth(int count)
{
    if (count < 0) {
        cout << "Error: Negative number" << endl;
        cattleCount = -1;  // use sentinel for error
    } else {
        cattleCount = count;
    }
}

// Classification logic
string CattleWealth::classifyWealth() const
{
    if (cattleCount < 0) {
        return "Error: Negative number";
    } else if (cattleCount < 10) {
        return "Not enough for bohali";
    } else if (cattleCount <= 20) {
        return "Small herd";
    } else {
        return "Wealthy cattle owner";
    }
}

// Display results
void CattleWealth::displayResult() const
{
    cout << classifyWealth() << endl;
}



int main(int argc, char** argv)
{
	   int cattle;
    cout << "Enter number of cattle: ";
    cin >> cattle;

    CattleWealth farmer(cattle);
    farmer.displayResult();
	
	return 0;
}
