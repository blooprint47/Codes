aa#include <bits/stdc++.h>
#include <iomanip>
#define YES cout<<"YES"<<endl
#define NO cout<<"NO"<<endl
typedef long long ll;
#define A7MAD ios_base::sync_with_stdio(NULL); cin.tie(0); cout.tie(0);
using namespace std;

int const N = 1e6 + 1;
int n, k,sol;
int a[N] ,t[N], cs[N];
//-----Cumulative Sum-----//
/*int cusu(int ary[],int l,int r) {
    cs[0] = ary[0];
    for(int i = 1;i<n;i++)
        cs[i]=cs[i-1]+ary[i];
    for(int i=0;i<q;i++) {
        sum=0;
        if(l==0)
            return cs[r];
        else
            return cs[r]-cs[l-1];
    }
    return sum;
}
*/

int main() {
    A7MAD
//cout<<fixed<<setprecision(9);
    cin>>n>>k;
    for(int i=0;i<n;i++) {
        cin>>a[i];
    }
    for(int i=0;i<n;i++) {
        cin>>t[i];
    }
    for(int i=0;i<n;i++) {
        if(t[i]==1) {
            sol+=a[i]; // n.o theories before we force her to stay awake k mins.
            a[i]=0; // we already added them arr=[0 0 5 0 5 4]
        }
    }
    cs[0]=a[0];
    for(int i=1;i<n;i++) {
        cs[i]=cs[i-1]+a[i];
    }

    int mx=0;
    for(int i=0, l, r;i<=n-k;i++) {
        l=i;
        r= i + k - 1; // -1 so we take k cells of the array because i start at 0

        if(l==0)
            mx=max(mx,cs[r]);
        else
            mx=max(mx,cs[r] - cs[l-1]);
    }
    // mx will contain largest sum of interval k in array "a"
    cout<< sol + mx <<endl;

    return 0;
}
//easy shi

