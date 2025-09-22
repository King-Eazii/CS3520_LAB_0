#include <iostream>
#include <string>
using namespace std;

class SesothoCalendar
{
private:
    int dayNumber;

public:
    // Constructor
    SesothoCalendar(int d);

    // Validation method
    bool isValid() const;

    // Get Sesotho day name
    string getDayName() const;

    // Display result
    void displayDay() const;
};

// Constructor
SesothoCalendar::SesothoCalendar(int d)
{
    dayNumber = d;
}

// Check if day number is valid
bool SesothoCalendar::isValid() const
{
    return (dayNumber >= 1 && dayNumber <= 7);
}

// Get Sesotho day name
string SesothoCalendar::getDayName() const
{
    if (!isValid())
	{
        return "Error: Invalid day number";
    }

    switch (dayNumber)
	{
        case 1: return "Mantaha";    // Monday
        case 2: return "Labobedi";   // Tuesday
        case 3: return "Laboraro";   // Wednesday
        case 4: return "Labone";     // Thursday
        case 5: return "Labohlano";  // Friday
        case 6: return "Moqebelo";   // Saturday
        case 7: return "Sontaha";    // Sunday
        default: return "Error: Invalid day number"; // should not reach here
    }
}

// Display result
void SesothoCalendar::displayDay() const
{
    cout << getDayName() << endl;
}


int main()
{
    int day;
    cout << "Enter day number (1-7): ";
    cin >> day;

    SesothoCalendar calendar(day);
    calendar.displayDay();

    return 0;
}
