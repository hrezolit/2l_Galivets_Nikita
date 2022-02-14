//
//  main.swift
//  2l_Galivets_Nikita
//
//  Created by Nikita on 7/2/22.
//

import Foundation

//MARK: - 1) Написать функцию, которая определяет, четное число или нет.

func definitionOf (number: Int) {
    
    guard number % 2 == 0 else { return print("\(number) is an odd number") }
    
    print("\(number) is an even number")
    
}

definitionOf(number: 1)



//MARK: - 2) Написать функцию, которая определяет, делится ли число без остатка на 3.

func dividingByThree (number: Int) {
    
    guard number % 3 == 0 else { return print("\(number) cannot be divided by three") }
    
    print("\(number) divided by three")
    
}

dividingByThree(number: 2)



//MARK: - 3) Создать возрастающий массив из 100 чисел.

var growingNumbers = [Int]()

for number in 1...100 {
    
    growingNumbers.append(number)
    
}

print(growingNumbers)



//MARK: - 4) Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

//Удаление четных чисел
for i in growingNumbers {
    
    if i % 2 == 0 {
        growingNumbers.remove(at: growingNumbers.firstIndex(of: i)!)
        
    }
    
}

//Удаление чисел, которые не делятся на 3
for i in growingNumbers {
    
    if i % 3 == 0 {
        growingNumbers.remove(at: growingNumbers.firstIndex(of: i)!)
        
    }
}

print(growingNumbers)



//MARK: - 5) * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов. Числа Фибоначчи определяются соотношениями Fn = Fn-1 + Fn-2.

//функция для создания массива с заданным количеством элементов
func numberOfElementsIn(array: Int) -> [Int] {
    
    var fiboNumbers = [Int]()
    
    for quantity in 0..<array {
        fiboNumbers.append(fiboGenerating(number: quantity))
    }
    
    // Генерируем число фибоначчи
    func fiboGenerating(number: Int) -> Int {
        
        guard number > 1 else { return number}
        return fiboGenerating(number: number - 1) + fiboGenerating(number: number - 2)
        
    }
    return fiboNumbers
}

let fibonacchiNumbers = numberOfElementsIn(array: 20)
print(fibonacchiNumbers)



//MARK: - 6) * Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу.

//Пример простых чисел: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 49, 53, 59, 61, 67, 71, 73, 77, 79, 83, 89, 91, 97...

func generatePrimeArray (withCapacity: Int) -> [Int] {
    
    //массив чисел
    var simpleNumbers = [Int]()
    //массив нечетных чисел
    var oddNumbers = [Int]()
    //массив почти простых чисел =)
    var almostPrimeNumbers = [Int]()
    //массив простых чисел
    var primeNumbers = [Int]()
    
    let p = 2
    
    //генерируем масив чисел с заданным ренжом
    for simpleNumber in 2...withCapacity {
        simpleNumbers.append(simpleNumber)
    }
    
    //отсеиваем четные числа
    oddNumbers = simpleNumbers.enumerated().compactMap { $0.offset % p == p - 2 ? nil : $0.element }
    
    //отфильтровываем числа кратные трем
    almostPrimeNumbers = oddNumbers.filter { $0 % 3 != 0 }
    
    //отфильтровываем числа кратные пяти
    primeNumbers = almostPrimeNumbers.filter { $0 % 5 != 0 }
    
    //три первых числа, как исключение, возвращаем в массив
    primeNumbers.insert(2, at: 0)
    primeNumbers.insert(3, at: 1)
    primeNumbers.insert(5, at: 2)
    
    return primeNumbers
    
}

let primeNumbers = generatePrimeArray(withCapacity: 100)
print(primeNumbers)





