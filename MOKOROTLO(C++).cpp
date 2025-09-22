#include <iostream>
using namespace std;

class BasothoHat 
{
	private:
    	int height;   // height of the triangle

	public:
    // Constructor
    	BasothoHat(int h);

    // Print the triangle
    	void printPattern() const;
};

// Constructor implementation
BasothoHat::BasothoHat(int h)
{
    if (h <= 0)
	{
        cout << "Invalid height, Must be positive." << endl;
        height = 0;
    } else {
        height = h;
    }
}

// Print pattern implementation
void BasothoHat::printPattern() const
{
    if (height <= 0) return;

    for (int line = 1; line <= height; line++)
	{
        int stars = 2 * line - 1; 
        for (int i = 0; i < stars; i++) {
            cout << "*";
        }
        cout << endl;
    }
}

int main() 
{
    int h;
    cout << "Enter height of triangle: ";
    cin >> h;

    BasothoHat hat(h);
    hat.printPattern();

    return 0;
}
