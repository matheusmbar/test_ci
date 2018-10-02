#include "CppUTest/TestHarness.h"
#include "application.h"

TEST_GROUP(base_test){

    void setup (){
    }

    void teardown (){
    }
};

TEST (base_test, pass_me){
    BYTES_EQUAL (1, 1);
    func0();
}

TEST (base_test, pass_me_too){
    BYTES_EQUAL (2, 2);
    func1();
}

TEST (base_test, pass_me_three){
    func2(2);
    func2(12);
    BYTES_EQUAL (3,3);
}
