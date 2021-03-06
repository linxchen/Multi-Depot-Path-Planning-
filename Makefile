DIRS := . MWPM MWPM/MinCost
#DIRS := . MinCost GEOM 

SOURCES := $(foreach dir, $(DIRS), $(wildcard $(dir)/*.cpp))
OBJS := $(patsubst %.cpp, %.o, $(SOURCES))

CFLAGS := -std=c++11 -O3 -D_NDEBUG 
CXX ?= g++
LIBS := 
INCLUDES := 
LIBDIR := 

# Add librt if the target platform is not Darwin (OS X)
ifneq ($(shell uname -s),Darwin)
    LIBS += -lrt
endif
 
#all: blossom5

testMDCPP: ${OBJS}
	$(CXX) $(CFLAGS) ${LIBDIR} -o $@ ${OBJS} ${LIBS}

.cpp.o:
	$(CXX) $(CFLAGS) ${INCLUDES} $< -c -o $@

clean:
	rm -f ${OBJS} blossom5
