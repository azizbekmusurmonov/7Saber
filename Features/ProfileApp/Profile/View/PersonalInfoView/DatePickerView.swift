//
//  DatePickerView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 03/05/24.
//

import SwiftUI
import AssetKit
import Core

struct DatePickerView: View {
    
    @State private var header = "Birthday"
    @State private var showPicker = false
    @State private var birthDate = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                VStack(alignment: .leading) {
                    Text(header)
                        .font(.system(size: 11, weight: .regular))
                        .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                    Text(dateFormatter.string(from: birthDate))
                }
                Spacer()
                Button(action: {
                    showPicker.toggle()
                }) {
                    Image(uiImage: Asset.Image.Icons.calendar.image)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            .onTapGesture {
                showPicker.toggle()
            }
            if showPicker {
                DatePicker(selection: $birthDate, displayedComponents: .date) {
                    Text("")
                }
                .datePickerStyle(.wheel)
            }
        }
        //        .opacity(showPicker ? 1.0 : 0.0)
        Divider()
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
