//
//  divlib.cpp
//  Division
//
//  Created by Eduard Dzhumagaliev on 12/21/19.
//  Copyright © 2019 Eduard Dzhumagaliev. All rights reserved.
//

#include "divlib.hpp"

std::pair<float, float> DivLib::readFloats(const char* from) {
    std::fstream file;
    file.open(from, std::ios::in);
    
    if (file.fail()) {
        throw std::invalid_argument("Failed to read file. Please make sure your filename is right.");
    }
    
    std::string a1, a2;
    float b1, b2;
    file >> a1;
    file >> a2;
    try {
        b1 = std::stof(a1);
    }
    catch (std::invalid_argument) {
        throw std::domain_error("Failed to read float 1 from file. There should be two floats in input file.");
    };
    file >> a2;
    try {
        b2 = std::stof(a2);
    }
    catch (std::invalid_argument) {
        throw std::domain_error("Failed to read float 2 from file. There should be two floats in input file.");
    };
    
    return std::make_pair(b1, b2);
}

float DivLib::division(float numerator, float denominator) {
    /*
     Behaviour of division by zero is undefined by default in C++
     Basically in means that instead of throwing exception
     I could format person's SSD and it would be OK by C++ standards 🙂
     */
    if (denominator == 0) throw std::domain_error("Denominator shouldn't be equal to zero.");
    
    return numerator / denominator;
}
