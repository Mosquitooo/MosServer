
#把所有的目录做成变量，方便修改和移植   
BIN = ./bin  
SRC = ./src  
INC = ./include  
OBJ = ./obj 
   
#提取所有源文件(即：*.c文件)和所有中间文件(即：*.o)  
SOURCE = $(wildcard ${SRC}/*.cpp)  
OBJECT = $(patsubst %.cpp,${OBJ}/%.o,$(notdir ${SOURCE}))  
   
#设置最后目标文件  
TARGET = MainServer 
BIN_TARGET = ${BIN}/${TARGET}  
   
CC = g++   
CFLAGS = -g -Wall -I${INC}   
   
#用所有中间文件生成目的文件，规则中可以用 $^替换掉 ${OBJECT}  
${BIN_TARGET}:${OBJECT}  
	$(CC) -o $@ ${OBJECT}  
   
#生成各个中间文件  
%.o:%.cpp   
	$(CC) $(CFLAGS) -o $@ -c $<  
   
.PHONY:clean  
clean:  
	find $(OBJ) -name *.o -exec rm -rf {} \;
	rm -rf $(BIN_TARGET)