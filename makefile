###################################################
# Targets:
###################################################

default:
	test -d bin || mkdir bin
	javac -d bin src/*.java
	test -d doc || mkdir doc
	javadoc -d doc -sourcepath src src/*.java

compile c: 
	test -d bin || mkdir bin
	javac -d bin src/*.java

printit: compile
	java -classpath bin PrintIt

searchit: compile
	java -classpath bin SearchIt

javadoc:
	test -d doc || mkdir doc
	javadoc -d doc -sourcepath src src/*.java

searchitlinear: compile
	java -classpath bin SearchItLinear

junit: compile
	javac -d test/ -cp /usr/share/java/hamcrest.jar:/usr/share/java/junit.jar:bin test/*.java
	java -cp .:/usr/share/java/junit.jar:test:bin org.junit.runner.JUnitCore BSTTest

###################################################
# Housekeeping:
###################################################

clean:
	test bin/*.class || rm bin/*.class
	test doc/* || rm doc/*
	test test/*.class || rm test/*.class
tar:
	tar cvf Assignment1.tar.gz ./
