CC = gcc
CFLAGS   = -Wall -g -O3 `sdl2-config --cflags` # Compilation flags and include paths
LIBS     = -lSDL2_ttf -lSDL2_image             # Additional Libraries
LFLAGS   = `sdl2-config --libs`                # Library flags
SRCS = main.c fonctions_fichiers.c Fonction_SDL.c joueur.c sdl2-ttf-light.c
OBJS = $(SRCS:.c=.o)
BIN = main
EXEC = $(BIN)

all: $(EXEC)

$(BIN) : $(OBJS)
	$(CC) $(CFLAGS) -o $(BIN) $^ $(LIBS) $(LFLAGS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@ $(LIBS) $(LFLAGS)

clean:
	$(RM) *.o *~ $(BIN)

mrproper: clean
	$(RM) $(EXEC)
