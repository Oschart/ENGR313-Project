#include <bits/stdc++.h>

using namespace std;

void remComma(string &s)
{
    string t = "";
    for(char c : s)
    {
        if(c != ',') t += c;
    }
    s = t;
}
int main()
{
    ifstream in("table.dat");
    ofstream out("Table1.dat", ofstream::out);
    out << 'P' << ' ' << "Vg" << '\n';
    string line;
    while(getline(in, line))
    {
        stringstream st(line);
        string P, Vg;
        st >> P;
        st >> Vg >> Vg;    //dummy
        st >> Vg;
        remComma(P), remComma(Vg);
        out << P << ' ' << Vg << '\n';

    }
    in.close();
    out.close();
}