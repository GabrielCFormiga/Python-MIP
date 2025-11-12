#include <iostream>
#include <vector>
#include <bitset>

using namespace std;

vector<int> patterns;

// for subject i and student j, subject_masks[i] & (1 << j) checks if student j is in subject i
int subject_masks[6] = {
    0b0001111,
    0b0010001,
    0b1100100,
    0b1010000,
    0b1000010,
    0b0011000
};

void solve(int index, int pattern_mask, int student_mask) {
    if (index == 6) {
        for (auto p : patterns) {
            if (p == pattern_mask) return;
        }
        patterns.push_back(pattern_mask);
        return;
    }

    solve(index + 1, pattern_mask, student_mask); // don't select subject index

    if ((subject_masks[index] & student_mask) == 0) {
        solve(index + 1, (pattern_mask | (1 << index)), (student_mask | subject_masks[index]));
    }
}

int main() {
    solve(0, 0, 0);

    for (auto p : patterns) {
        cout << bitset<6>(p) << endl;
    }

    return 0;
}