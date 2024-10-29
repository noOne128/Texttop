#include "libstrutil.hpp"

void strutil::toLower(std::string str) {
  for (char &c : str) {
    c = std::tolower(static_cast<unsigned char>(c));
  }
}
