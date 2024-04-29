//
//  SectionModel.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 14/04/24.
//

import SwiftUI

public struct SectionModel {
    let headertitle: String
    let cells: [ProfilecellModel]
}

public struct ProfilecellModel {
    let title: String
    let hasRightIcon: Bool
    let number: String
    let pushToView: any View
}
