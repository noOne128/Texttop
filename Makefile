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

bin/txtop: build/txtop.o | bin
	@printf "# Compiling bin/txtpop..."
	@g++ -MMD -MP build/txtop.o -o bin/txtop
	@printf "done\n"

build/txtop.o: src/main.cpp | build
	@printf "# Compiling build/txtop.o..."
	@g++ src/main.cpp -o build/txtop.o
	@printf "done\n"

.PHONY: all
