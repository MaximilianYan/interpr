.PHONY: all # clean
all: interpr

# COMPILE_DEFAULT_FLAGS_WITHOUTO = -I headers -Wno-attributes -Wshadow -Winit-self -Wredundant-decls -Wcast-align -Wundef -Wfloat-equal -Winline -Wunreachable-code -Wmissing-declarations -Wmissing-include-dirs -Wswitch-enum -Wswitch-default -Wmain -Wextra -Wall -g -pipe -fexceptions -Wcast-qual -Wconversion -Wctor-dtor-privacy -Wempty-body -Wformat-security -Wformat=2 -Wignored-qualifiers -Wlogical-op -Wmissing-field-initializers -Wnon-virtual-dtor -Woverloaded-virtual -Wpointer-arith -Wsign-promo -Wstack-usage=8192 -Wstrict-aliasing -Wstrict-null-sentinel -Wtype-limits -Wwrite-strings -D_EJUDGE_CLIENT_SIDE
COMPILE_DEFAULT_FLAGS = -c -I source -od=build
# COMPILE_FLAGS = $(COMPILE_DEFAULT_FLAGS) $(COMPILE_AVX_FLAGS) -D_DEBUG
# COMPILE_FLAGS = $(COMPILE_DEFAULT_FLAGS) $(COMPILE_AVX_FLAGS) -DNDEBUG
COMPILE_FLAGS = $(COMPILE_DEFAULT_FLAGS)

# COMPILE_O = @ g++ $(COMPILE_FLAGS) -c $^ -o $@
COMPILE_O = @ ldc2 $(COMPILE_FLAGS) $^


# LIBOPENCV_PATH := D:\programming\libraries\opencv-4.6.0\opencv-build-release-freetype
# LIBOPENCV_HEADERS := $(LIBOPENCV_PATH)\install\include
# LIBOPENCV_NAME := opencv_world460
# LIBOPENCV_LINK := -L$(LIBOPENCV_PATH)\bin -l$(LIBOPENCV_NAME)
# LIBOPENCV_INCLUDE := -isystem$(LIBOPENCV_HEADERS)

# CONFIG_INCLUDE :=  -I "..\config"

# COMPILE_FLAGS += $(LIBOPENCV_INCLUDE)
# COMPILE_FLAGS_O0 += $(LIBOPENCV_INCLUDE)
# LINK_FLAGS     = $(LIBOPENCV_LINK)


NAME = interpr
build\${NAME}.o: source\${NAME}.d
	${COMPILE_O}
# OBJECTS := ${OBJECTS} build\${NAME}.o
# build\${NAME}.o: source\${NAME}.cpp
#	${COMPILE_O} -DCOMPILENAME=$(COMPILENAME)
#	${COMPILE_O}                          -DCOMPILENAME='"Of single plain"'

NAME = display
OBJECTS := ${OBJECTS} build\${NAME}.o
build\${NAME}.o: source\${NAME}.d
	${COMPILE_O}

NAME = language
OBJECTS := ${OBJECTS} build\${NAME}.o
build\${NAME}.o: source\${NAME}.d
	${COMPILE_O}

NAME = parser
OBJECTS := ${OBJECTS} build\${NAME}.o
build\${NAME}.o: source\${NAME}.d
	${COMPILE_O}

NAME = runner
OBJECTS := ${OBJECTS} build\${NAME}.o
build\${NAME}.o: source\${NAME}.d
	${COMPILE_O}


interpr: ${OBJECTS}
#	@ g++ $(COMPILE_FLAGS) $^ -o build\mandelbrot $(LINK_FLAGS)

clean:
	@ del build\*.o build\*.exe build\*.lib
