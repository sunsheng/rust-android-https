all:
	cargo run

android:
	./build.sh

.PHONY: clean
clean:
	cargo clean
