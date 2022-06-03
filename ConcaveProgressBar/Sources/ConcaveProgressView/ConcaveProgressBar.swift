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
/// You can customize the appearance of the concave progress view
public struct ConcaveProgressBar: View {
  @Binding var value: Float
  
  fileprivate var foreground = Color.accentColor
  fileprivate var background = Color.secondary.opacity(0.3)
  fileprivate var strokeStyle = StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round)
  fileprivate var animation = Animation.easeInOut
  
  public var body: some View {
    ZStack {
      SemiCircle(padding: strokeStyle.lineWidth)
        .stroke(foreground, style: strokeStyle)
      
      SemiCircle(padding: strokeStyle.lineWidth)
        .trim(from: 0.0, to: CGFloat(value))
        .stroke(background, style: strokeStyle)
        .animation(animation, value: value)
    }
  }
}

public extension ConcaveProgressBar {
  func stroke(_ style: StrokeStyle) -> Self {
    var newSelf = self
    newSelf.strokeStyle = style
    return newSelf
  }
  
  func foreground(_ color: Color) -> Self {
    var newSelf = self
    newSelf.foreground = color
    return newSelf
  }
  
  func background(_ color: Color) -> Self {
    var newSelf = self
    newSelf.background = color
    return newSelf
  }
  
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
    ConcaveProgressBar(value: .constant(0.9))
      .stroke(.init(lineWidth: 8, lineCap: .round, lineJoin: .round))
      .frame(width: 300, height: 100)
  }
}
