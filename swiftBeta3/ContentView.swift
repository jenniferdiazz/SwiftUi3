//
//  ContentView.swift
//  swiftBeta3
//
//  Created by Jennifer Diaz on 19-08-23.
//

import SwiftUI

struct ContentView: View {
    @State var isOn: Bool = false
    @State var iPhoneCounter: Int = 1
    @State var iPhoneCounter2: Int = 1
    @State var iPhoneCounter3: Float = 0.0
    @State var isEditing: Bool = false
    let elements = 1...500
    let gridItem = [GridItem(.fixed(100)),
                    GridItem(.adaptive(minimum: 20)),
                    GridItem(.fixed(100))]
    
    var body: some View {
        
        Form{
            Toggle("Sucribete", isOn : $isOn)
            Text("\(isOn.description)")
        }
        Form{
            Stepper("iphone\(iPhoneCounter)", value: $iPhoneCounter, in: 1...5, step: 2)
            Stepper("iphone\(iPhoneCounter2)"){
                iPhoneCounter2 += 1
                print("[Incrementar] número \(iPhoneCounter2)")
            }onDecrement:{
                iPhoneCounter2 -= 1
                print("[Decrementar] número \(iPhoneCounter2)")
                
            }
        }
        Form{
            Slider( value: $iPhoneCounter3,
                    in: 0...10,
                    step: 1,
                    onEditingChanged: { (editing) in isEditing = editing
                
            },
                    minimumValueLabel: Text("min"),
                    maximumValueLabel: Text("max")
            ){
                Text("Selecciona numero de iphones")
            }
            Text("\(iPhoneCounter3)")
                .foregroundColor(isEditing ? .green : .red )
            
                    
            
        }
        
        LazyVGrid(columns: [GridItem(.fixed(100)),GridItem(.fixed(100)),GridItem(.fixed(100))], content: {
            Text("Placeholder")
            Text("Placeholder")
            Text("Placeholder")
        })
        
        ScrollView(.horizontal){
            LazyHGrid(rows: gridItem, content: {
                ForEach(elements, id: \.self) { element in
                    VStack{
                        Circle().frame(height: 20)
                        Text("\(element)")}
                    
                }
            })
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
