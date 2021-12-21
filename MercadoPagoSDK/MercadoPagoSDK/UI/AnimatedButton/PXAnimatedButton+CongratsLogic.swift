import Foundation

extension PXAnimatedButton {
    static func animateButtonWith(status: String, statusDetail: String? = nil, explode: Bool) {
        PXNotificationManager.Post.animateButton(with: PXAnimatedButtonNotificationObject(status: status, statusDetail: statusDetail, explode: explode))
    }
}
