import UIKit

extension PXSpruce {
    /// Run a spruce style animation on this view. This method is the most basic form of a spruce animation and allows you to setup your view with stock spruce animations. Feel free to chain together animations that would work nicely together.
    ///
    /// - Note: Possible animations include
    ///   - Fading
    ///   - Scaling
    ///   - Translating
    ///   - Rotating
    /// - Note: Default animation type is `StandardAnimation` and SortFunction is `LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)`
    ///
    ///   See `StockAnimation` for more details
    ///
    /// - Parameters:
    ///   - animations: an array of stock animations
    ///   - duration: duration of each individual animation
    ///   - completion: a closure that is called upon the final animation completing. A `Bool` is passed into the closure letting you know if the animation has completed. **Note:** If you stop animations on the whole animating view, then `false` will be passed into the completion closure. However, if the final animation is allowed to proceed then `true` will be the value passed into the completion closure.
    func animate(_ animations: [StockAnimation], duration: TimeInterval = 0.3, completion: CompletionHandler? = nil ) {
        let animation = StandardAnimation(duration: duration)
        self.animate(animations, duration: duration, animationType: animation, completion: completion)
    }

    /// Run a spruce style animation on this view. This allows you to setup your view with stock spruce animations. Feel free to chain together animations that would work nicely together.
    ///
    /// - Note: Possible animations include
    ///   - Fading
    ///   - Scaling
    ///   - Translating
    ///   - Rotating
    /// - Note: Default animation type is `StandardAnimation`
    ///
    ///   See `StockAnimation` for more details
    ///
    /// - Parameters:
    ///   - animations: an array of stock animations
    ///   - duration: duration of each individual animation
    ///   - sortFunction: the `sortFunction` to be used when setting the offsets for each subviews animation
    ///   - completion: a closure that is called upon the final animation completing. A `Bool` is passed into the closure letting you know if the animation has completed. **Note:** If you stop animations on the whole animating view, then `false` will be passed into the completion closure. However, if the final animation is allowed to proceed then `true` will be the value passed into the completion closure.
    func animate(_ animations: [StockAnimation], sortFunction: SortFunction, duration: TimeInterval = 0.3, completion: CompletionHandler? = nil ) {
        let animation = StandardAnimation(duration: duration)
        self.animate(animations, duration: duration, animationType: animation, sortFunction: sortFunction, completion: completion)
    }

    /// Run a spruce style animation on this view. This method allows you to setup your view with stock spruce animations. Feel free to chain together animations that would work nicely together.
    ///
    /// - Note: Default SortFunction is `LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)`
    /// - Parameters:
    ///   - animations: an array of stock animations
    ///   - duration: duration of each individual animation
    ///   - animationType: style of animation that each view should follow. Don't worry about setting the `changeFunction`. We will set that using the stock animations that you provide. If you have a value there it will be overwritten. (ex: SpringAnimation)
    ///   - completion: a closure that is called upon the final animation completing. A `Bool` is passed into the closure letting you know if the animation has completed. **Note:** If you stop animations on the whole animating view, then `false` will be passed into the completion closure. However, if the final animation is allowed to proceed then `true` will be the value passed into the completion closure.
    func animate(_ animations: [StockAnimation], duration: TimeInterval = 0.3, animationType: Animation, completion: CompletionHandler? = nil) {
        let sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.05)
        self.animate(animations, duration: duration, animationType: animationType, sortFunction: sortFunction, completion: completion)
    }

    /// Run a spruce style animation on this view. This method allows you to setup your view with stock spruce animations. Feel free to chain together animations that would work nicely together.
    ///
    /// - Parameters:
    ///   - animations: an array of stock animations
    ///   - duration: duration of each individual animation
    ///   - animationType: style of animation that each view should follow. Don't worry about setting the `changeFunction`. We will set that using the stock animations that you provide. If you have a value there it will be overwritten. (ex: SpringAnimation)
    ///   - sortFunction: the `sortFunction` to be used when setting the offsets for each subviews animation
    ///   - prepare: a `bool` as to whether we should run `prepare` on your view for you. If set to `true`, then we will run `prepare` right before the animation using the stock animations that you provided. If `false`, then `prepare` will not run. (default is `true`)
    ///   - completion: a closure that is called upon the final animation completing. A `Bool` is passed into the closure letting you know if the animation has completed. **Note:** If you stop animations on the whole animating view, then `false` will be passed into the completion closure. However, if the final animation is allowed to proceed then `true` will be the value passed into the completion closure.
    func animate(_ animations: [StockAnimation], duration: TimeInterval = 0.3, animationType: Animation, sortFunction: SortFunction, prepare: Bool = true, completion: CompletionHandler? = nil) {
        if prepare {
            self.prepare(with: animations)
        }

        /* Create the animations */
        var animationType = animationType
        animationType.changeFunction = { view in
            for animation in animations {
                let animationFunc = animation.animationFunction
                animationFunc(view)
            }
        }
        self.animate(withSortFunction: sortFunction, animation: animationType, completion: completion)
    }

    /// Use this method to setup all of your views before the animation occurs. This could include hiding, fading, translating them, etc...
    /// Given the array of stock animations, the change functions required to prepare those animations will automatically be run for you. No need to specify your own custom change function here.
    /// - Note: If you run this after the views are visible, then this would cause a slight stutter of the viewport. This could cause UX issues since the views would flash on the screen.
    ///
    /// - Parameters:
    ///   - animations: an array of stock animations
    ///   - recursiveDepth: an int describing how deep into the view hiearchy the subview search should go
    func prepare(with animations: [StockAnimation], recursiveDepth: Int = 0) {
        /* Reset the views to prepare for the animations */
        let clearFunction: ChangeFunction = { view in
            for animation in animations {
                let clearFunc = animation.prepareFunction
                clearFunc(view)
            }
        }

        let subviews = self.subviews(withRecursiveDepth: recursiveDepth)
        UIView.performWithoutAnimation {
            for subview in subviews {
                guard let animatedView = subview.view else {
                    continue
                }
                clearFunction(animatedView)
            }
        }
    }

    /// Quick method to hide all of the subviews of a view. Use this if you want to make sure that none of the views that will be animated will be shown on screen before you transition them.
    ///
    /// - Parameter recursiveDepth: an int describing how deep into the view hiearchy the subview search should go
    func hideAllSubviews(recursiveDepth: Int = 0) {
        let subviews = self.subviews(withRecursiveDepth: recursiveDepth)
        UIView.performWithoutAnimation {
            for subview in subviews {
                guard let animatedView = subview.view else {
                    continue
                }
                animatedView.isHidden = true
            }
        }
    }
}
