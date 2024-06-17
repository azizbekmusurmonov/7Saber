//
//  ProfileList.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 02/05/24.
//

import SwiftUI
import AssetKit
import Core

struct ProfileList: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            ForEach(0..<ProfileConstans.shared.profileSectionData.count, id: \.self) { index in
                let sections = ProfileConstans.shared.profileSectionData
                Text(sections[index].headertitle)
                    .font(.system(size: 23, weight: .bold))
                    .bold()
                
                ForEach(0..<sections[index].cells.count) { cellIndex in
                    let destinationView = sections[index].cells[cellIndex].pushToView // Explicitly define destination view
                    
                    NavigationLink(
                        destination: sections[index].cells[cellIndex].pushToView,
                        label: {
                            HStack {
                                Text(sections[index].cells[cellIndex].title)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.black)
                                                                
                                Spacer()
                                
                                if sections[index].cells[cellIndex].hasRightIcon {
                                    Image(systemName: "chevron.right")
                                        .resizable()
                                        .frame(width: 5.59, height: 12)
                                        .foregroundColor(.black)
                                }
                            }
                            .frame(height: 56)
                        }
                    )
                    Divider()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileList()
}
