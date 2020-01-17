//
//  divlib.hpp
//  Division
//
//  Created by Eduard Dzhumagaliev on 12/21/19.
//  Copyright © 2019 Eduard Dzhumagaliev. All rights reserved.
//

#ifndef divlib_hpp
#define divlib_hpp

#include <fstream>
#include <string>
#include <utility>

namespace DivLib {
    /**
     @brief Read a pair of floats from file
     @discussion The floats are extracted from file *line by line*
     @param from File name from which the floats are extracted
     @throws std::invalid_argument if failed to read file
     @throws std::domain_error if not enough floats in file (should be two)
     @return A pair of floats
     */
    std::pair<float, float> readFloats(const char* from);

    /**
     @brief Divide two floats
     @discussion Divides two floats
     @param numerator First float
     @param denominator Second float, shouldn't be equal to zero
     @throws std::domain_error if `a2` is equal to zero (obviously a2 is out of its domain)
     @return Division result
     @
     */
    float division(float numerator, float denominator);
}

#endif /* divlib_hpp */
