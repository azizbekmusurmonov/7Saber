//
//  ProfileConstans.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 26/04/24.
//

import SwiftUI

struct ProfileConstans {
    static let shared = ProfileConstans()
    
    let profileSectionData: [SectionModel] = [
        SectionModel(headertitle: "ACCOUNT",
                     cells: [
                        ProfilecellModel(title: "Personal information",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PersonalInfoView())),
                        ProfilecellModel(title: "Addresses",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(AddressView())),
                        ProfilecellModel(title: "Payment methods",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PaymentMethodView()))
                     ]),
        SectionModel(headertitle: "ORDERS",
                     cells: [
                        ProfilecellModel(title: "Current orders",
                                         hasRightIcon: true,
                                         number: "3",
                                         pushToView: AnyView(CurrentOrdersView())),
                        ProfilecellModel(title: "Order history",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(OrderHistoryView())),
                        
                     ]),
        SectionModel(headertitle: "SETTINGS",
                     cells: [
                        ProfilecellModel(title: "Push notifications",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PushNotificationView())),
                        ProfilecellModel(title: "Privacy",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PrivacyView())),
                        ProfilecellModel(title: "Language",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(LanguageView())),
                        ProfilecellModel(title: "Country / Region",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(CountryRegionView()))
                     ]),
        SectionModel(headertitle: "HELP CENTER",
                     cells: [
                        ProfilecellModel(title: "Push notifications",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PushNotificationView())),
                        ProfilecellModel(title: "Privacy",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PrivacyView())),
                        ProfilecellModel(title: "Language",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(LanguageView())),
                        ProfilecellModel(title: "Country / Region",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(CountryRegionView()))
                     ]),
        SectionModel(headertitle: "LEGAL",
                     cells: [
                        ProfilecellModel(title: "General Terms & Conditions",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(GeneralTermsView())),
                        ProfilecellModel(title: "Terms of Use",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(TermsUseView())),
                        ProfilecellModel(title: "Privacy Policy",
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PrivacyPolicyView()))
                     ])
    ]
}

