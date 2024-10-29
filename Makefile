all: bin/txtop

clean:
	@printf "# Cleaning object files..."
	@rm build/*.o
	@printf "done"

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
	@g++ -MMD -MP build/txtop.o -o bin/txtop
	@printf "done\n"

build/txtop.o: src/main.cpp | build
	@printf "# Compiling build/txtop.o..."
	@g++ src/main.cpp -o build/txtop.o
	@printf "done\n"

lib/libstrutil.so: lib/libstrutil.o | lib
	@printf "# Linking lib/libstrutil.o..."
	@g++ -shared lib/libstrutil.o -o lib/libstrutil.so
	@printf "done"

lib/libstrutil.o: src/lib/libstrutil.cpp src/lib/libstrutil.hpp | lib
	@printf "# Compiling lib/libstrutil.o..."
	@g++ -fPIC -c src/lib/libstrutil.cpp -o lib/libstrutil.o
	@printf "done"

run:
	LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$TEXTTOP_PATH" $TEXTTOP_BIN_PATH/txtop

.PHONY: all clean
