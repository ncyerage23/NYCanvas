# MAKEFILE FOR NYCANVAS
# 	idk. copied most from NYFW's make 

CC=gcc
CFLAGS=-Iinclude

BDIR=build
LDIR=lib
OBJ=build/canvas.o build/font.o build/nymg.o


$(LDIR)/libnycanvas.a: $(OBJ) | $(LDIR)
	ar rcs $@ $(OBJ)

$(BDIR):
	mkdir -p $(BDIR)

$(LDIR):
	mkdir -p $(LDIR)

$(BDIR)/canvas.o: src/canvas.c | $(BDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BDIR)/font.o: src/font.c | $(BDIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BDIR)/nymg.o: src/nymg.c | $(BDIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f build/*.o
	rm -f lib/libnycanvas.a
