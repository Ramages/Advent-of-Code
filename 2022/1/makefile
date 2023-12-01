ifeq ($(OS), Windows_NT)
	EXECUTABLE := $(BIN)day_1.exe
	DELETE := del
endif

FLAGSO := g++ -g -c -std=c++11 -Wall -Wextra -Wpedantic -fpermissive
FLAGSL := g++ -g -std=c++11 -Wall -Wextra -Wpedantic -fpermissive


all: $(BUILD) $(EXECUTABLE)

$(EXECUTABLE): main.o
	$(FLAGSL) main.o -o $(EXECUTABLE)

main.o: day_1.c
	$(FLAGSO) day_1.c -o main.o

clean:
	-$(DELETE) main.o $(EXECUTABLE)