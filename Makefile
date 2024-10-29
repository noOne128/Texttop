all: bin/txtop

clean:
	@if [ "$(wildcard build/*.o)" ]; then \
		@printf "# Cleaning object files..."; \
		@rm -f build/*.o
		@printf "done\n"
	fi
	@if [ "$(wildcard build/*.o)" ]; then \
		@printf "# Cleaning binaries..."
		@rm -f bin/*
		@printf "done\n"
	fi
	@if [ "$(wildcard build/*.o)" ]; then \
		@printf "# Cleaning shared objects..."
		@rm -f lib/*
		@printf "done\n"
	fi

build:
	@printf "Creating directory build..."
	@mkdir -p build
	@printf "done\n"

bin:
	@printf "# Creating directory bin..."
	@mkdir -p bin
	@printf "done\n"

lib:
	@printf "# Creating directory lib..."
	@mkdir -p lib
	@printf "done\n"

bin/txtop: build/txtop.o lib/libstrutil.so | bin
	@printf "# Compiling bin/txtpop..."
	@g++ -MMD -MP build/txtop.o -o bin/txtop -Llib -lstrutil -Wall -Wextra
	@printf "done\n"

build/txtop.o: src/main.cpp | build
	@printf "# Compiling build/txtop.o..."
	@g++ -c src/main.cpp -o build/txtop.o -Wall -Wextra
	@printf "done\n"

lib/libstrutil.so: lib/libstrutil.o | lib
	@printf "# Linking lib/libstrutil.o..."
	@g++ -shared lib/libstrutil.o -o lib/libstrutil.so -Wall -Wextra
	@printf "done"

lib/libstrutil.o: src/lib/libstrutil.cpp src/lib/libstrutil.hpp | lib
	@printf "# Compiling lib/libstrutil.o..."
	@g++ -fPIC -c src/lib/libstrutil.cpp -o lib/libstrutil.o -Wall -Wextra
	@printf "done"

run:
	LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${TEXTTOP_PATH}" "${TEXTTOP_BIN_PATH}/txtop"

.PHONY: all clean
