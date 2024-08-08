//
//  ProfileConstans.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 26/04/24.
//

import SwiftUI
import AssetKit

struct ProfileConstans {
    static let shared = ProfileConstans()
    
    let profileSectionData: [SectionModel] = [
        SectionModel(headertitle: "ACCOUNT",
                     cells: [
                        ProfilecellModel(title: Localizations.personalInformation,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PersonalInfoView().environmentObject(PersonalInfoViewModel()))),
                        ProfilecellModel(title: Localizations.addresses,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(AddressView().environmentObject(AddressesViewModel()))),
                        ProfilecellModel(title: Localizations.paymentMethods,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PaymentMethodView().environmentObject(PaymentMethodViewModel())))
                     ]),
        SectionModel(headertitle: "ORDERS",
                     cells: [
                        ProfilecellModel(title: Localizations.currentOrders,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(CurrentOrdersView().environmentObject(OrdersViewModel()))),
                        ProfilecellModel(title: Localizations.orderHistory,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(OrderHistoryView().environmentObject(OrdersViewModel()))),
                        
                     ]),
        SectionModel(headertitle: "SETTINGS",
                     cells: [
                        ProfilecellModel(title: Localizations.pushNotifications,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PushNotificationView())),
                        ProfilecellModel(title: Localizations.privacy,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PrivacyView())),
                        ProfilecellModel(title: Localizations.language,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(LanguageView())),
                        ProfilecellModel(title: Localizations.countryRegion,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(CountryRegionView()))
                     ]),
        SectionModel(headertitle: "HELP CENTER",
                     cells: [
                        ProfilecellModel(title: Localizations.pushNotifications,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PushNotificationView())),
                        ProfilecellModel(title: Localizations.privacy,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PrivacyView())),
                        ProfilecellModel(title: Localizations.language,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(LanguageView())),
                        ProfilecellModel(title: Localizations.countryRegion,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(CountryRegionView()))
                     ]),
        SectionModel(headertitle: "LEGAL",
                     cells: [
                        ProfilecellModel(title: Localizations.generalTermsConditions,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(GeneralTermsView())),
                        ProfilecellModel(title: Localizations.termsOfUse,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(TermsUseView())),
                        ProfilecellModel(title: Localizations.privacyPolicy,
                                         hasRightIcon: true,
                                         number: "",
                                         pushToView: AnyView(PrivacyPolicyView()))
                     ])
    ]
}
