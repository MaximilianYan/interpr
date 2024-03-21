.PHONY: all clean
all: interpr

COMPILE_DEFAULT_FLAGS = -c -I source -od=build
COMPILE_FLAGS = $(COMPILE_DEFAULT_FLAGS)

COMPILE_O = @ ldc2 $(COMPILE_FLAGS) $^
LINK_O = @ ldc2 $^


NAME = interpr
OBJECTS := ${OBJECTS} build\${NAME}.obj
build\${NAME}.obj: source\${NAME}.d
	${COMPILE_O}

NAME = display
OBJECTS := ${OBJECTS} build\${NAME}.obj
build\${NAME}.obj: source\${NAME}.d
	${COMPILE_O}

NAME = language
OBJECTS := ${OBJECTS} build\${NAME}.obj
build\${NAME}.obj: source\${NAME}.d
	${COMPILE_O}

NAME = parser
OBJECTS := ${OBJECTS} build\${NAME}.obj
build\${NAME}.obj: source\${NAME}.d
	${COMPILE_O}

NAME = runner
OBJECTS := ${OBJECTS} build\${NAME}.obj
build\${NAME}.obj: source\${NAME}.d
	${COMPILE_O}


interpr: ${OBJECTS}
	${LINK_O}
	@ move interpr.exe build > nul

clean:
	@ del build\*.obj build\*.exe
