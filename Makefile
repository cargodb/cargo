all: build run

clean:
	@swift build --clean=dist

build:
	@swift build

run:
	@.build/debug/cargo
