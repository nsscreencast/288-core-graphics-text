import UIKit
import PlaygroundSupport
import AVFoundation

final class CustomView: UIView {
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }

		let colorSpace = CGColorSpaceCreateDeviceRGB()
		let color = CGColor(colorSpace: colorSpace, components: [1, 1, 1, 1])!

		context.setFillColor(color)
		context.fill(bounds)

		let string = "Hello World"

		let paragraph = NSMutableParagraphStyle()
		paragraph.alignment = .center

		let attributes: [String: Any] = [
			NSFontAttributeName: UIFont.systemFont(ofSize: 40),
			NSForegroundColorAttributeName: UIColor.blue,
			NSParagraphStyleAttributeName: paragraph
		]

//		(string as NSString).draw(at: CGPoint(x: 20, y: 20), withAttributes: attributes)

		let attributedString = NSMutableAttributedString(string: string, attributes: attributes)
		attributedString.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 40, weight: UIFontWeightBold), range: NSRange(location: 6, length: 5))

		let size = attributedString.size()
		attributedString.draw(in: AVMakeRect(aspectRatio: size, insideRect: bounds))

//		let label = UILabel()
//		label.attributedText = attributedString
//		label.drawText(in: bounds)
	}
}

PlaygroundPage.current.liveView = CustomView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
