//
//  InstructionsContentRenderer.swift
//  MercadoPagoSDK
//
//  Created by AUGUSTO COLLERONE ALFONSO on 11/15/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import Foundation

class InstructionsContentRenderer: NSObject {

    func render(instructionsContent: PXInstructionsContentComponent) -> UIView {
        let instructionsContentView = ContentView()
        instructionsContentView.translatesAutoresizingMaskIntoConstraints = false
        instructionsContentView.backgroundColor = .pxLightGray
        var bottomView: UIView!

        if instructionsContent.hasInfo(), let infoComponent = instructionsContent.getInfoComponent() {
            instructionsContentView.infoView = infoComponent.render()
            instructionsContentView.addSubview(instructionsContentView.infoView!)
            MPLayout.pinTop(view: instructionsContentView.infoView!, to: instructionsContentView).isActive = true
            MPLayout.centerHorizontally(view: instructionsContentView.infoView!, to: instructionsContentView).isActive = true
            MPLayout.equalizeWidth(view: instructionsContentView.infoView!, to: instructionsContentView).isActive = true
            bottomView = instructionsContentView.infoView
        }

        
        if instructionsContent.hasReferences(), let referencesComponent = instructionsContent.getReferencesComponent() {
            instructionsContentView.referencesView = referencesComponent.render()
            instructionsContentView.addSubview(instructionsContentView.referencesView!)
            if let lastView = bottomView {
                MPLayout.put(view: instructionsContentView.referencesView!, onBottomOf: lastView).isActive = true
            } else {
                MPLayout.pinTop(view: instructionsContentView.referencesView!, to: instructionsContentView).isActive = true
            }

            MPLayout.centerHorizontally(view: instructionsContentView.referencesView!, to: instructionsContentView).isActive = true
            MPLayout.equalizeWidth(view: instructionsContentView.referencesView!, to: instructionsContentView).isActive = true
            bottomView = instructionsContentView.referencesView
        }

        if instructionsContent.hasTertiaryInfo(), let tertiaryInfoComponent = instructionsContent.getTertiaryInfoComponent() {
            instructionsContentView.tertiaryInfoView = tertiaryInfoComponent.render()
            instructionsContentView.addSubview(instructionsContentView.tertiaryInfoView!)
            if let lastView = bottomView {
                MPLayout.put(view: instructionsContentView.tertiaryInfoView!, onBottomOf: lastView).isActive = true
            } else {
                MPLayout.pinTop(view: instructionsContentView.tertiaryInfoView!, to: instructionsContentView).isActive = true
            }
            MPLayout.centerHorizontally(view: instructionsContentView.tertiaryInfoView!, to: instructionsContentView).isActive = true
            MPLayout.equalizeWidth(view: instructionsContentView.tertiaryInfoView!, to: instructionsContentView).isActive = true
            bottomView = instructionsContentView.tertiaryInfoView
        }

        
        if instructionsContent.hasAccreditationTime(), let accreditationTimeComponent = instructionsContent.getAccreditationTimeComponent() {
            instructionsContentView.accreditationTimeView = accreditationTimeComponent.render()
            instructionsContentView.addSubview(instructionsContentView.accreditationTimeView!)
            if let lastView = bottomView {
                MPLayout.put(view: instructionsContentView.accreditationTimeView!, onBottomOf: lastView).isActive = true
            } else {
                MPLayout.pinTop(view: instructionsContentView.accreditationTimeView!, to: instructionsContentView).isActive = true
            }

            MPLayout.centerHorizontally(view: instructionsContentView.accreditationTimeView!, to: instructionsContentView).isActive = true
            MPLayout.equalizeWidth(view: instructionsContentView.accreditationTimeView!, to: instructionsContentView).isActive = true
            bottomView = instructionsContentView.accreditationTimeView
        }
        if instructionsContent.hasActions(), let actionsComponent = instructionsContent.getActionsComponent() {
            instructionsContentView.actionsView = actionsComponent.render()
            instructionsContentView.addSubview(instructionsContentView.actionsView!)
            if let lastView = bottomView {
                MPLayout.put(view: instructionsContentView.actionsView!, onBottomOf: lastView).isActive = true
            } else {
                MPLayout.pinTop(view: instructionsContentView.actionsView!, to: instructionsContentView).isActive = true
            }

            MPLayout.centerHorizontally(view: instructionsContentView.actionsView!, to: instructionsContentView).isActive = true
            MPLayout.equalizeWidth(view: instructionsContentView.actionsView!, to: instructionsContentView).isActive = true
            bottomView = instructionsContentView.actionsView
        }

        MPLayout.pinBottom(view: bottomView, to: instructionsContentView, withMargin: MPLayout.L_MARGIN).isActive = true

        return instructionsContentView
    }
}

class ContentView: UIView {
    public var infoView: UIView?
    public var referencesView: UIView?
    public var tertiaryInfoView: UIView?
    public var accreditationTimeView: UIView?
    public var actionsView: UIView?
}
