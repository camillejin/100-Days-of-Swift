//
//  ContentView.swift
//  iExpense
//

import SwiftUI

struct fontColor: ViewModifier {
    var currency: String
    var amount: Double

    @ViewBuilder
    func body(content: Content) -> some View {
        if (currency=="USD") {
            if amount < 10 {
                content.foregroundColor(.black)
            }
            else if amount < 100 {
                content.foregroundColor(.purple)
            }
            else {
                content.foregroundColor(.orange)
            }
        } else {
            content.foregroundColor(.black)
        }
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
                List {
                    Section(header: Text("Personal")) {
                        ForEach(expenses.items, id: \.id) { item in
                            if (item.type == "Personal") {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                            .modifier(fontColor(currency: item.currency, amount: item.amount))
                                        Text(item.type)
                                    }
                                    Spacer()
                                    Text(item.amount, format: .currency(code: item.currency))
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                    Section(header: Text("Business")) {
                        ForEach(expenses.items, id: \.id) { item in
                            if (item.type == "Business") {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                            .modifier(fontColor(currency: item.currency, amount: item.amount))
                                        Text(item.type)
                                    }
                                    Spacer()
                                    Text(item.amount, format: .currency(code: item.currency))
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
