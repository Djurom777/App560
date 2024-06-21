//
//  AnalyticsViewModel.swift
//  App560
//
//  Created by IGOR on 20/06/2024.
//

import SwiftUI

final class AnalyticsViewModel: ObservableObject {

    @AppStorage("totalAir") var totalAir: Int = 0
    @AppStorage("UnRev") var UnRev: Int = 0
    @AppStorage("Satis") var Satis: Int = 0
    @AppStorage("onRep") var onRep: Int = 0
    @AppStorage("totalAir2") var totalAir2: Int = 1

}

