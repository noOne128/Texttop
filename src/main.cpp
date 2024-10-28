#include <iostream>
#include "lib/libfs.hpp"

int main() {
  if (fs::exists("~/.local/state/txtop/setup")) {
    std::cout << "Welcome back!\n";
  }/* else {
    std::cout << "Welcome to TextTop! Would you like to run setup? (Y/N)\n";
    std::string input;
    while (!(input == std::string("y").)) {
      std::cin >> input;
      if (input )
    }
  }*/
}
