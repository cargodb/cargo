all: build run

clean:
	@swift build --clean=dist

xcode:
	@rm -rf cargo.xcodeproject
	@swift package generate-xcodeproj

build:
	@swift build

run:
	@.build/debug/cargo
