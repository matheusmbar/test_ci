#include "CppUTest/TestHarness.h"

TEST_GROUP(base_test){

    void setup (){
    }

    void teardown (){
    }
};

TEST (base_test, pass_me){
    BYTES_EQUAL (1, 1);
}

TEST (base_test, pass_me_too){
    BYTES_EQUAL (2, 2);
}

TEST (base_test, fail_me){
    BYTES_EQUAL (1, 0);
}
