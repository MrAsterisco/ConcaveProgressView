//
//  ConcaveProgressBar.swift
//
//  Created by Alessio Moiso on 03.01.22.
//
import SwiftUI

/// A view that shows the progress towards completion of a task.
///
/// # Overview
/// This view behaves exactly like a `ProgressView` and displays a determinate
/// type of progress.
///
/// You can create a progress view by initializing it with a binding to a numeric value
/// that indicates the progress. The progress is a number constrained between `0.0` and `1.0`.
///
/// # Styling
/// You can customize the appearance of the concave progress view using the extension methods for
/// `foreground`, `background`, `stroke` and `animation`.
public struct ConcaveProgressBar: View {
  @Binding var value: Float
  
  fileprivate var foreground = Color.accentColor
  fileprivate var background = Color.secondary.opacity(0.3)
  fileprivate var strokeStyle = StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round)
  fileprivate var animation = Animation.easeInOut
  
  /// The content and behavior of the view.
  public var body: some View {
    ZStack {
      SemiCircle(padding: strokeStyle.lineWidth)
        .stroke(background, style: strokeStyle)
      
      SemiCircle(padding: strokeStyle.lineWidth)
        .trim(from: 0.0, to: CGFloat(value))
        .stroke(foreground, style: strokeStyle)
        .animation(animation, value: value)
    }
  }
}

public extension ConcaveProgressBar {
  /// Set the primary color value of the view.
  ///
  /// - returns: A view that uses the specified color for the progress bar.
  func foreground(_ color: Color) -> Self {
    var newSelf = self
    newSelf.foreground = color
    return newSelf
  }
  
  /// Set the secondary color value of the view.
  ///
  /// - returns: A view that uses the specified color as background.
  func background(_ color: Color) -> Self {
    var newSelf = self
    newSelf.background = color
    return newSelf
  }
  
  /// Set the bar style.
  ///
  /// - returns: A view that uses the specified style to draw the progress bar.
  func barStyle(_ style: StrokeStyle) -> Self {
    var newSelf = self
    newSelf.strokeStyle = style
    return newSelf
  }
  
  /// Set the animation for changing value.
  ///
  /// - returns: A view that uses the specified animation when changing its value.
  func animation(_ animation: Animation) -> Self {
    var newSelf = self
    newSelf.animation = animation
    return newSelf
  }
}

// MARK: - SemiCircle
fileprivate struct SemiCircle: Shape {
  let padding: CGFloat
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    let width = rect.size.width - padding/2
    let height = rect.size.height - padding/2
    
    path.move(to: CGPoint(x: padding/2, y: height))
    path.addQuadCurve(
      to: CGPoint(x: width, y: height),
      control: CGPoint(x: width/2, y: -height + padding)
    )
    
    return path
  }
}

// MARK: - Preview
struct ProgressBar_Previews: PreviewProvider {
  static var previews: some View {
    ConcaveProgressBar(value: .constant(0.6))
      .barStyle(.init(lineWidth: 8, lineCap: .round, lineJoin: .round))
      .foreground(.red)
      .background(.gray)
      .frame(width: 190, height: 100)
  }
}
