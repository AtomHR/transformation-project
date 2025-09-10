//
//  ContentView.swift
//  calculator of everything
//
//  Created by Atom HR on 09.09.2025.
//

import SwiftUI

struct ContentView: View {
    
    // Температуры
    @FocusState private var amountIsFocused: Bool
    @State private var number_1 = 0.0
    @State private var transformations = "Фарингейты"
    @State private var transformations_1 = "Фарингейты"
    let trans = ["Фарингейты", "Цельсия", "Кельвина"]
    
    var name: Double {
        
        
        if transformations == "Фарингейты" && transformations_1 == "Цельсия" {
            let cels = (number_1 - 32) * 5 / 9
            return cels
        } else if transformations == "Фарингейты" && transformations_1 == "Кельвина" {
            let cels = (number_1 - 32) * 5 / 9
            let kels = cels + 273.15
            return kels
        } else if transformations == "Цельсия" && transformations_1 == "Фарингейты" {
            let far = number_1 * 9 / 5 + 32
            return far
        } else if transformations == "Цельсия" && transformations_1 == "Кельвина" {
            let kels = number_1 + 273.15
            return kels
        } else if transformations == "Кельвина" && transformations_1 == "Фарингейты" {
            let far = (number_1 - 273.15) * 9 / 5 + 32
            return far
        } else if transformations == "Кельвина" && transformations_1 == "Цельсия" {
            let cels = number_1 - 273.15
            return cels
        } else {
            return number_1
        }
        
    }
    
    
    
    
    
    //Длинны
    @State private var number_2 = 0.0
    @State private var transformations_2 = "Километры"
    @State private var transformations_3 = "Километры"
    let long = ["Метры", "Километры", "Футы", "Ярды", "Мили"]
    
    
    
    //вариант 2, без ошибок
    var name_copy: Double {
        let metrs: Double
        switch transformations_2 {
            case "Метры": metrs = number_2
            case "Километры": metrs = number_2 * 1000
            case "Футы": metrs = number_2 / 3.28084
            case "Ярды": metrs = number_2 * 0.9144
            case "Мили": metrs = number_2 * 1609.34
            default:metrs = number_2
        }
        switch transformations_3 {
            case "Метры": return metrs
            case "Километры": return metrs / 1000
            case "Футы": return metrs * 3.28084
            case "Ярды": return metrs / 0.9144
            case "Мили": return metrs / 1609.34
            default: return metrs
        }
    }
    
    /*
     
     
    //вариант 1, возможны ошибки
    var name_1: Double {
        
        switch (transformations_2, transformations_3) {
            
        // Метры
            case ("Метры", "Километры"):
                return number_2 / 1000
            case ("Метры", "Футы"):
                return number_2 * 3.28084
            case ("Метры", "Ярды"):
                return number_2 * 1.09361
            case ("Метры", "Мили"):
                return number_2 / 1609.34
            
        // Километры
           case ("Километры", "Метры"):
                return number_2 * 1000
            case ("Километры", "Футы"):
                return number_2 * 3280.84
            case ("Километры", "Ярды"):
                return number_2 * 1093.61
            case ("Километры", "Мили"):
                return number_2 * 0.621371
            
        // Футы
           case ("Футы", "Метры"):
                return number_2 / 3.28084
            case ("Футы", "Километры"):
                return number_2 / 3280.84
            case ("Футы", "Ярды"):
                return number_2 / 3.0
            case ("Футы", "Мили"):
                return number_2 / 5280
            
        // Ярды
           case ("Ярды", "Метры"):
                return number_2 * 0.9144
            case ("Ярды", "Километры"):
                return number_2 / 1093.61
            case ("Ярды", "Футы"):
                return number_2 * 3
            case ("Ярды", "Мили"):
                return number_2 / 1760
            
        // Мили
            case ("Мили", "Метры"):
                return number_2 * 1609.34
            case ("Мили", "Километры"):
                return number_2 * 1.60934
            case ("Мили", "Футы"):
                return number_2 * 5280
            case ("Мили", "Ярды"):
                return number_2 * 1760
            
            default:
                return number_2
        }
    }
     
    
    */
    
    
    //Преобразование обьема
    
    @State private var number_3 = 0.0
    @State private var transformations_4 = "Миллилитры"
    @State private var transformations_5 = "Миллилитры"
    let volume = ["Миллилитры", "Литры", "Пинты", "Галлоны"]
    

    var name_2: Double {
        // Сначала конвертируем в миллилитры
        let milliliters: Double
        switch transformations_4 {
        case "Миллилитры":
            milliliters = number_3
        case "Литры":
            milliliters = number_3 * 1000
        case "Пинты":
            milliliters = number_3 * 473.176
        case "Галлоны":
            milliliters = number_3 * 3785.41
        default:
            milliliters = number_3
        }
        
        // Затем конвертируем в целевую единицу
        switch transformations_5 {
        case "Миллилитры": return milliliters
        case "Литры": return milliliters / 1000
        case "Пинты": return milliliters / 473.176
        case "Галлоны": return milliliters / 3785.41
        default: return milliliters
        }
    }

    
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                
        // Температуры
                
                Section{
                    Text("Преобразование температур.")
                }
                
                Section("То из чего мы переобразуем:") {
                    Picker("Система измерения: ", selection: $transformations) {
                        ForEach(trans, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("То во что мы переобразуем:") {
                    Picker("Система измерения: ", selection: $transformations_1) {
                        ForEach(trans, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("То из чего мы переобразуем: ") {
                    TextField("Сколько вы хотите преобразовать?", value: $number_1, format: .number)
                }
                .keyboardType(.decimalPad)
                .focused($amountIsFocused)
                
                
                Section("Ваш итог переобразования:") {
                    Text("Вы переобразовали \(transformations) в \(transformations_1), и ваш итог получился: \(name.formatted(.number.precision(.fractionLength(2)))) \(transformations_1)")
                }
                
                
                
              
                
                
        //Длинны
                Section{
                    Text("Преобразование длины.")
                }
                
                Section("То из чего мы переобразуем:") {
                    Picker("Система измерения: ", selection: $transformations_2) {
                        ForEach(long, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("То во что мы переобразуем:") {
                    Picker("Система измерения: ", selection: $transformations_3) {
                        ForEach(long, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("То из чего мы переобразуем: ") {
                    TextField("Сколько вы хотите преобразовать?", value: $number_2, format: .number)
                }
                .keyboardType(.decimalPad)
                .focused($amountIsFocused)
                
                
                Section("Ваш итог переобразования:") {
                    Text("Вы переобразовали \(transformations_2) в \(transformations_3), и ваш итог получился: \(name_copy.formatted(.number.precision(.fractionLength(2)))) \(transformations_3)")
                }
                
              
                
            //Преобразование обьема
                
                Section{
                    Text("Преобразование обьема.")
                }
                
                Section("То из чего мы переобразуем:") {
                    Picker("Система измерения: ", selection: $transformations_4) {
                        ForEach(volume, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("То во что мы переобразуем:") {
                    Picker("Система измерения: ", selection: $transformations_5) {
                        ForEach(volume, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("То из чего мы переобразуем: ") {
                    TextField("Сколько вы хотите преобразовать?", value: $number_3, format: .number)
                }
                .keyboardType(.decimalPad)
                .focused($amountIsFocused)
                
                
                Section("Ваш итог переобразования:") {
                    Text("Вы переобразовали \(transformations_4) в \(transformations_5), и ваш итог получился: \(name_2.formatted(.number.precision(.fractionLength(2)))) \(transformations_5)")
                }
        
                
            }
            .navigationTitle(Text("Calculator"))
            .toolbar {
                if amountIsFocused {
                    Button("Готово") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
