#include <stdio.h>

extern char const*const greeting;

int main(int argc, char const *argv[]) {
	puts(greeting);
	return 0;
}
